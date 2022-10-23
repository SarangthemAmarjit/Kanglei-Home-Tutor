import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form1/Refactor/alertbox.dart';
import 'package:form1/models/user.dart';

import 'package:form1/pages/login_page.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_popup/internet_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigationPage() async {}

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final checkString = prefs.getString("phonePrimary");
    final usertype = prefs.getString("usertype");
    if (checkString != 'null' && usertype == "admin") {
      context.router.replaceNamed('/adminnavbar');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final user = Provider.of<Userok?>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/splash1.png',
                        height: MediaQuery.of(context).size.height / 3),
                    const SizedBox(
                      height: 6,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text('Learn anything\nAnytime anywhere',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                              fontSize: 36)),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Home Tutor Services Provide a way for Students\nable to understand a clear concept.',
                      textAlign: TextAlign.center,
                      style: softpurpleColorTextStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 210,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return alertbox;
                            },
                          );
                          try {
                            final result =
                                await InternetAddress.lookup('google.com');
                            if (result.isNotEmpty &&
                                result[0].rawAddress.isNotEmpty) {
                              if (user == null) {
                                Navigator.pop(context);
                                log(user.toString());
                                context.router.replaceNamed('/splashscreen2');
                              } else {
                                Navigator.pop(context);
                                context.router.push(UserNavbarRoute(
                                    screenwidth: screenwidth.toInt()));
                              }
                            }
                          } on SocketException catch (_) {
                            context.router.replaceNamed('/nointernet');
                          }
                        },
                        child: Text(
                          'Get Started',
                          style: whiteTextStyle.copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
