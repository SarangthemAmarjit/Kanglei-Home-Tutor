import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form1/logic/LoginCubit/LoginUser_cubit.dart';
import 'package:form1/pages/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_widget/ticket_widget.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class AdminLoginPage extends StatefulWidget {
  @override
  _LoginPhoneADMINState createState() => _LoginPhoneADMINState();
}

class _LoginPhoneADMINState extends State<AdminLoginPage> {
  late DatabaseReference _dbrefADMIN;

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  String PhoneNumber = "0";

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId = '';

  bool showLoading = false;

  saveData(phone) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("phonePrimary", phone);
    prefs.setString("usertype", "admin");
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        _dbrefADMIN = FirebaseDatabase.instance.ref("hometutorAdmin");

        // Obtain shared preferences.
        saveData(PhoneNumber);
        CustomSnackBar(context, const Text('Login Successfully'), Colors.green);
        context.router.replaceNamed('/adminnavbar');
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      //  _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text("s")));
    }
  }

  @override
  initState() {
    phoneController.text = "+91";
  }

  getMobileFormWidget(BuildContext context) {
    return TicketWidget(
      width: 350,
      height: 450,
      isCornerRounded: true,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Spacer(),
          Image.asset("assets/images/iconhome2.png",
              fit: BoxFit.cover, width: 100, height: 100),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "ADMIN LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: "Phone Number",
              border: OutlineInputBorder(),
              hintText: "",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () async {
              setState(() {
                showLoading = true;
              });

              _dbrefADMIN = FirebaseDatabase.instance.ref("hometutorAdmin");
              final snapshot = await _dbrefADMIN
                  .child("${phoneController.value.text}")
                  .get();
              if (snapshot.exists) {
                print(snapshot.value);
                setState(() {
                  showLoading = true;
                });
                PhoneNumber = phoneController.text;

                await _auth.verifyPhoneNumber(
                  phoneNumber: phoneController.text,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      showLoading = false;
                    });
                    //signInWithPhoneAuthCredential(phoneAuthCredential);
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      showLoading = false;
                    });
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      showLoading = false;
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORM_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {},
                );
              } else {
                setState(() {
                  showLoading = false;
                });
                AlertController.show(
                  " ERROR !! ",
                  "YOU DONT HAVE THE RIGHT TO ACCESS AS ADMIN!",
                  TypeAlert.error,
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Send",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.send,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ),
          ),

          // ElevatedButton(onPressed: (){
          //   _dbrefADMIN = FirebaseDatabase.instance.ref("ehomeADMIN");
          //   _dbrefADMIN.child("+917005807751").set("{'val' : 'true'}");
          //
          // }, child: Text("Test")),
          // ElevatedButton(onPressed: ()async{
          //   _dbrefADMIN = FirebaseDatabase.instance.ref("ehomeADMIN");
          //   final snapshot = await _dbrefADMIN.child("700").get();
          //   if (snapshot.exists) {
          //     print(snapshot.value);
          //   } else {
          //     print('No data available.');
          //   }
          //
          // }, child: Text("Get")),
          Spacer(),
        ],
      ),
    );
  }

  getOtpFormWidget(context) {
    return TicketWidget(
      width: 350,
      height: 450,
      isCornerRounded: true,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Spacer(),
          const Icon(
            Icons.security,
            size: 100,
            color: Colors.green,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "ADMIN LOGIN",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: otpController,
            decoration: InputDecoration(
              labelText: "OTP",
              border: OutlineInputBorder(),
              hintText: "Enter OTP",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: otpController.text);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text("VERIFY"),
          ),
          Spacer(),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Do you want to go to Main login Page?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.router.replaceNamed('/splashscreen2'),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          key: _scaffoldKey,
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 174, 248, 244),
                  Color.fromARGB(255, 203, 244, 249),
                  Color.fromARGB(255, 255, 254, 254),
                  Color.fromARGB(255, 252, 252, 228),
                  Color.fromARGB(255, 249, 237, 249),
                  Color.fromARGB(255, 255, 254, 254),
                ],
              ),
            ),
            child: Center(
              child: Container(
                child: showLoading
                    ? const Center(
                        child: SpinKitSquareCircle(
                          color: Colors.amber,
                        ),
                      )
                    : currentState ==
                            MobileVerificationState.SHOW_MOBILE_FORM_STATE
                        ? getMobileFormWidget(context)
                        : getOtpFormWidget(context),
                padding: const EdgeInsets.all(16),
              ),
            ),
          )),
    );
  }
}
