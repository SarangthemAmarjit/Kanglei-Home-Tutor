import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form1/pages/sidemenu.dart';
import 'package:form1/services/auth.dart';
import 'package:form1/theme.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AccoutPage extends StatefulWidget {
  const AccoutPage({Key? key}) : super(key: key);

  @override
  State<AccoutPage> createState() => _AccoutPageState();
}

class _AccoutPageState extends State<AccoutPage> {
  String usermail = '';

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email").toString();

    setState(() {
      usermail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: Text(
          'My Account',
          style: regularTextStyle4,
        ),
        backgroundColor: const Color.fromARGB(255, 40, 180, 207),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 203, 244, 249),
              Color.fromARGB(255, 203, 244, 249),
              Color.fromARGB(255, 255, 254, 254),
              Color.fromARGB(255, 252, 252, 228),
              Color.fromARGB(255, 249, 237, 249),
              Color.fromARGB(255, 255, 254, 254),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    "assets/images/person.jpg",
                    width: 300,
                    height: 300,
                  )),
              Container(
                child: Center(
                    child: Text(
                  usermail,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: (MediaQuery.of(context).size.width / 4),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'User',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) {
                          return AlertDialog(
                            title: const Text('Confirm'),
                            content: const Text('Do You Want to Logout?'),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("CANCEL")),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        onPressed: () async {
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          log('Log Out');
                                          AuthService().signout().then((value) {
                                            if (prefs.containsKey('email')) {
                                              prefs.remove('email');
                                            }
                                            AuthService().Googlesignout();

                                            return context.router
                                                .replaceNamed('/splashscreen2');
                                          });
                                        },
                                        child: const Text("YES")),
                                  )
                                ],
                              ),
                            ],
                          );
                        }));
                  },
                  child: const Text("LOGOUT"))
            ],
          ),
        ),
      ),
    );
  }
}
