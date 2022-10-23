import 'package:auto_route/auto_route.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/services/auth.dart';
import 'package:form1/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AminaccoutPage extends StatefulWidget {
  const AminaccoutPage({Key? key}) : super(key: key);

  @override
  State<AminaccoutPage> createState() => _AminaccoutPageState();
}

class _AminaccoutPageState extends State<AminaccoutPage> {
  String admin_number = '';
  String usertypeadmin = '';
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  late DatabaseReference _dbrefADMIN;
  TextEditingController phonenumbercontroller = TextEditingController();
  checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String checkString = prefs.getString("phonePrimary").toString();
    String usertype = prefs.getString("usertype").toString();
    setState(() {
      admin_number = checkString;
      usertypeadmin = usertype;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: regularTextStyle4,
        ),
        backgroundColor: const Color.fromARGB(255, 40, 180, 207),
        actions: [
          Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                  onTap: () {
                    context.router.push(const AdminReqestRoute());
                  },
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ))),
          Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                  onTap: () {
                    context.router.push(const AdminaddPersonRoute());
                  },
                  child: const Icon(
                    Icons.person_add,
                    color: Colors.black,
                  ))),
          Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                  onTap: () {
                    phonenumbercontroller.text = "+91";
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Add Admin'),
                          content: TextField(
                            controller: phonenumbercontroller,
                            decoration: const InputDecoration(
                                hintText: "Phone Number",
                                labelText: "Phone Number",
                                border: OutlineInputBorder()),
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('ADD'),
                              onPressed: () {
                                _dbrefADMIN =
                                    FirebaseDatabase.instance.ref("ehomeADMIN");
                                _dbrefADMIN
                                    .child(
                                        "${phonenumbercontroller.value.text}")
                                    .set("{'val' : 'true'}");

                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.admin_panel_settings,
                    color: Colors.black,
                  ))),
        ],
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
                  admin_number,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: (MediaQuery.of(context).size.width / 4),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    usertypeadmin,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                )),
              ),
              SizedBox(
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
                                          AuthService().signout().then((value) {
                                            prefs.setString(
                                                "phonePrimary", 'null');
                                            prefs.setString("usertype", 'null');
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
