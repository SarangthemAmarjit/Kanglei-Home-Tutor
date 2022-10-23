import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form1/Refactor/alertbox.dart';
import 'package:form1/logic/LoginCubit/LoginUser_cubit.dart';
import 'package:form1/logic/RegisterCubit/cubit/register_user_cubit.dart';
import 'package:form1/pages/widgets/snackbar.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/services/auth.dart';
import 'package:form1/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  bool isloading = false;

  String email = '';
  String password = '';
  String error = '';
  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }

  savemail(email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return BlocConsumer<RegisterUserCubit, RegisterUserState>(
      listener: (context, state) {
        switch (state) {
          case RegisterUserState.success:
            CustomSnackBar(
                context, const Text('Registration Successfully'), Colors.green);
            context.router
                .push(UserNavbarRoute(screenwidth: screenwidth.toInt()));
            break;
          case RegisterUserState.user_exists:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('User Already Exist'),
              ),
            );
            break;
          case RegisterUserState.weak_password:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please use a stronger password'),
              ),
            );
            break;
          case RegisterUserState.failed:
            AlertController.show(
              " ERROR !! ",
              "REGISTRATION FAIL!",
              TypeAlert.error,
            );
            break;
          case RegisterUserState.initial:
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return alertbox;
              },
            );
            break;
          case RegisterUserState.nointernet:
            context.router.replaceNamed('/nointernet');
            break;
          case RegisterUserState.loading:
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return alertbox;
              },
            );
            break;
        }
      },
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.only(top: 23.0),
            child: Column(children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Column(
                    children: [
                      Form(
                        key: _formkey,
                        child: Card(
                          shadowColor: Color.fromARGB(255, 248, 73, 73),
                          elevation: 7,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: 300.0,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Name is required';
                                      }
                                      if (RegExp("[A-Z,a-z]").hasMatch(value)) {
                                        return null;
                                      } else {
                                        return "Please Enter a Valid Name";
                                      }
                                    },
                                    controller: signupNameController,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    autocorrect: false,
                                    style: const TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.user,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Name',
                                      hintStyle: TextStyle(
                                          fontFamily: 'WorkSansSemiBold',
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email is required';
                                      }
                                      if (!RegExp(
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                          .hasMatch(value)) {
                                        return "Please Enter a Valid Email Address";
                                      }
                                    },
                                    controller: signupEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    autocorrect: false,
                                    style: const TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.envelope,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Email Address',
                                      hintStyle: TextStyle(
                                          fontFamily: 'WorkSansSemiBold',
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      }
                                    },
                                    controller: signupPasswordController,
                                    obscureText: _obscureTextPassword,
                                    autocorrect: false,
                                    style: const TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: const Icon(
                                        FontAwesomeIcons.lock,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                          fontFamily: 'WorkSansSemiBold',
                                          fontSize: 16.0),
                                      suffixIcon: GestureDetector(
                                        onTap: _toggleSignup,
                                        child: Icon(
                                          _obscureTextPassword
                                              ? FontAwesomeIcons.eye
                                              : FontAwesomeIcons.eyeSlash,
                                          size: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 25.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextFormField(
                                    controller: signupConfirmPasswordController,
                                    obscureText: _obscureTextConfirmPassword,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      }
                                      if (value !=
                                          signupPasswordController.text) {
                                        return 'Password Not Match';
                                      }
                                    },
                                    autocorrect: false,
                                    style: const TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: const Icon(
                                        FontAwesomeIcons.lock,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Confirmation',
                                      hintStyle: const TextStyle(
                                          fontFamily: 'WorkSansSemiBold',
                                          fontSize: 16.0),
                                      suffixIcon: GestureDetector(
                                        onTap: _toggleSignupConfirm,
                                        child: Icon(
                                          _obscureTextConfirmPassword
                                              ? FontAwesomeIcons.eye
                                              : FontAwesomeIcons.eyeSlash,
                                          size: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    textInputAction: TextInputAction.go,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 148, 114, 243),
                              Color.fromARGB(255, 114, 130, 252)
                            ],
                            begin: FractionalOffset(0.2, 0.2),
                            end: FractionalOffset(1.0, 1.0),
                            stops: <double>[0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: MaterialButton(

                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 42.0),
                            child: Text(
                              'SIGN UP',
                              style: regularTextStyle8.copyWith(fontSize: 23),
                            ),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              context.read<RegisterUserCubit>().registerUser(
                                  email: signupEmailController.text,
                                  password: signupPasswordController.text);
                              savemail(signupEmailController.text);
                            }
                          }),
                    ),
                  )
                ],
              ),
            ]));
      },
    );
  }
}
