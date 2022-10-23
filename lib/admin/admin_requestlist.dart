import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:form1/logic/Fetchdatacubit/admin_request/fetch_request_cubit.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/theme.dart';

class AdminReqestPage extends StatefulWidget {
  const AdminReqestPage({Key? key}) : super(key: key);

  @override
  _AdminReqestPageState createState() => _AdminReqestPageState();
}

class _AdminReqestPageState extends State<AdminReqestPage> {
  @override
  void initState() {
    super.initState();
    context.read<FetchRequestCubit>().getrequestlist();
  }

  late DatabaseReference _dbref;
  late DatabaseReference _dbref2;
  late DatabaseReference _dbref3;
  Widget build(BuildContext context) {
    List titleList = [];
    List sdetails = [];
    List tutorlist = [];
    List tutordetails = [];

    var c = context.watch<FetchRequestCubit>();
    String nulldata = c.state.nulldata;

    if (nulldata == "null") {
      tutorlist = [];
    } else {
      var data = c.state.hometutordata;
      data.forEach((key, value) {
        titleList.add(key); //get title
        //get logo

        sdetails.add(data[key]["data"]);
        print(sdetails[0]);
      });
      if (sdetails.contains('')) {
        log('No Request Found');
      } else {
        for (var item in sdetails) {
          item.forEach((key, value) {
            tutorlist.add(key);
            tutordetails.add(value);
          });
        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 40, 180, 207),
          title: Text("Request list", style: regularTextStyle4),
        ),
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
          child: tutorlist.isEmpty
              ? const Center(
                  child: Text(
                  'No Request Found',
                  style: TextStyle(fontSize: 25),
                ))
              : ListView.builder(
                  itemCount: tutorlist.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                        onTap: () {
                          context.router.push(AdminTutordetailRoute(
                              tutordetail: tutordetails[index]));
                        },
                        child: Card(
                          child: Container(
                              child: ListTile(
                            leading: const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.amber,
                                )),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${tutordetails[index]["name"]}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 5, 192, 102)),
                                        onPressed: () {
                                          _dbref = FirebaseDatabase.instance
                                              .ref("hometutordata4");
                                          _dbref
                                              .child(
                                                  "${tutordetails[index]['subject']}")
                                              .child("data")
                                              .child(
                                                  "${tutordetails[index]['class_category']}")
                                              .child(
                                                  "${tutordetails[index]["name"]}")
                                              .set({
                                            "name":
                                                "${tutordetails[index]["name"]}",
                                            "address":
                                                "${tutordetails[index]['address']}",
                                            "contact":
                                                "${tutordetails[index]['contact']}",
                                            "qualification":
                                                "${tutordetails[index]['qualification']}",
                                            "gender":
                                                "${tutordetails[index]['gender']}",
                                            "jobtype":
                                                "${tutordetails[index]['jobtype']}",
                                            "experience":
                                                "${tutordetails[index]['experience']}",
                                            "availability":
                                                "${tutordetails[index]['availability']}",
                                            "preferedworkarea":
                                                "${tutordetails[index]['preferedworkarea']}",
                                          }).whenComplete(() {
                                            log('Accepted');
                                            _dbref2 = FirebaseDatabase.instance
                                                .ref("hometutorwwu");
                                            _dbref2
                                                .child("WWU")
                                                .child("data")
                                                .child(
                                                    tutordetails[index]["name"])
                                                .remove()
                                                .whenComplete(() {
                                              AlertController.show(
                                                " Done Accepted",
                                                "Successfully!",
                                                TypeAlert.success,
                                              );
                                              log('Done Remove');
                                            }).whenComplete(() {
                                              _dbref3 = FirebaseDatabase
                                                  .instance
                                                  .ref("requeststatus");
                                              _dbref3
                                                  .child("WWU")
                                                  .child("data")
                                                  .child(tutordetails[index]
                                                      ['emailid'])
                                                  .update({
                                                "request_status": "Approved"
                                              }).whenComplete(() {
                                                context.router.replaceNamed(
                                                    '/usernavbar');
                                                AlertController.show(
                                                  " Done Submitted",
                                                  "Successfully!",
                                                  TypeAlert.success,
                                                );
                                              });
                                            });
                                          });
                                        },
                                        child: const Text('Approve')),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 224, 16, 20)),
                                        onPressed: () {
                                          log('Accepted');
                                          _dbref2 = FirebaseDatabase.instance
                                              .ref("hometutorwwu");
                                          _dbref2
                                              .child("WWU")
                                              .child("data")
                                              .child(
                                                  tutordetails[index]["name"])
                                              .remove()
                                              .whenComplete(() {
                                            AlertController.show(
                                              " Done Accepted",
                                              "Successfully!",
                                              TypeAlert.success,
                                            );
                                            log('Done Remove');
                                          });
                                        },
                                        child: const Text('Reject')),
                                  ],
                                ),
                              ],
                            ),
                          )),
                        ));
                  },
                ),
        ));
  }
}
