import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form1/Refactor/alertbox.dart';
import 'package:form1/logic/LoginCubit/LoginUser_cubit.dart';
import 'package:form1/logic/googlelogin.dart';
import 'package:form1/pages/forgetpage.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/services/auth.dart';
import 'package:form1/theme.dart';
import 'package:form1/pages/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  bool _obscureTextPassword = true;
  bool isloading = false;

  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String error = '';
  savemail(email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginCubit, LoginUserState>(listener: (context, state) {
      switch (state) {
        case LoginUserState.initial:
          log('Initial');
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return alertbox;
            },
          );
          break;

        case LoginUserState.loading:
          log('Loading');
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return alertbox;
            },
          );
          break;

        case LoginUserState.loaded:
          Navigator.pop(context);
          CustomSnackBar(
              context, const Text('Login Successfully'), Colors.green);
          context.router
              .push(UserNavbarRoute(screenwidth: screenwidth.toInt()));
          break;

        case LoginUserState.error:
          Navigator.pop(context);
          AlertController.show(
            " Error !!",
            "Invalid Email or Password",
            TypeAlert.warning,
          );

          break;
        case LoginUserState.nointernet:
          Navigator.pop(context);
          context.router.replaceNamed('/nointernet');
      }
    }, builder: (context, state) {
      return Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 23.0),
        child: Column(
          children: <Widget>[
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
                                    top: 20.0,
                                    bottom: 20.0,
                                    left: 25.0,
                                    right: 25.0),
                                child: TextFormField(
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
                                  controller: loginEmailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      FontAwesomeIcons.envelope,
                                      color: Colors.black,
                                      size: 22.0,
                                    ),
                                    hintText: 'Email Address',
                                    hintStyle: TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 17.0),
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
                                    top: 20.0,
                                    bottom: 30.0,
                                    left: 25.0,
                                    right: 25.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required';
                                    }
                                  },
                                  controller: loginPasswordController,
                                  obscureText: _obscureTextPassword,
                                  style: const TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: const Icon(
                                      FontAwesomeIcons.lock,
                                      size: 22.0,
                                      color: Colors.black,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 17.0),
                                    suffixIcon: GestureDetector(
                                      onTap: _toggleLogin,
                                      child: Icon(
                                        _obscureTextPassword
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
                      height: 27,
                    )
                  ],
                ),
                Card(
                  elevation: 8,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: Text('SIGN IN',
                            style: regularTextStyle8.copyWith(fontSize: 20)),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          print('valid');
                          context.read<LoginCubit>().loginUser(
                              email: loginEmailController.text,
                              password: loginPasswordController.text);
                          savemail(loginEmailController.text);
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextButton(
                  onPressed: () {
                    context.router.replaceNamed('/forgetpassword');
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 97, 170, 243),
                        fontSize: 16.0,
                        fontFamily: 'WorkSansMedium'),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromARGB(26, 246, 202, 202),
                            Color.fromARGB(255, 139, 136, 136),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      'Or',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 87, 176, 235),
                          fontSize: 16.0,
                          fontFamily: 'WorkSansMedium'),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromARGB(255, 139, 136, 136),
                            Color.fromARGB(26, 246, 202, 202),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await Google_login().googlesignin(context, screenwidth.toInt());
              },
              child: Container(
                  height: 50,
                  width: 280,
                  child: Image.asset(
                    'assets/images/google2.png',
                    fit: BoxFit.fill,
                  )),
            ),
          ],
        ),
      );
    });
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
