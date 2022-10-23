import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form1/models/user.dart';
import 'package:form1/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  void navigationPage() async {}
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userok?>(context);
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
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
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/home tutor.png',
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                const SizedBox(
                  height: 6,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('KANGLEI HOME TUTOR',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.coustard(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 235, 132, 22),
                          fontSize: 20)),
                ),
                const SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      final result = await InternetAddress.lookup('google.com');
                      if (result.isNotEmpty &&
                          result[0].rawAddress.isNotEmpty) {
                        log(user.toString());

                        context.router.replaceNamed('/login');
                      }
                    } on SocketException catch (_) {
                      context.router.replaceNamed('/nointernet');
                    }
                  },
                  child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 68, 5, 242)
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login or Register using Email",
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(Icons.phone_android)
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    context.router.replaceNamed('/adminloginpage');
                  },
                  child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 68, 5, 242)
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login as ADMIN",
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(Icons.admin_panel_settings)
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
