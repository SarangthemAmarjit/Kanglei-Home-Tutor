import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:form1/Refactor/tutorlist.dart';
import 'package:form1/admin/admin_addperson.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:form1/theme.dart';

class ClassPage extends StatefulWidget {
  final String subjectname;
  final String image;
  final Map<Object?, Object?> classlist;
  const ClassPage(
      {Key? key,
      required this.subjectname,
      required this.image,
      required this.classlist})
      : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  String? itemvalue2;
  Container teacherlist = Container();
  List<String> listitem = [
    'Class I - V',
    'Class VI - VIII',
    'Class IX - X',
    'Class XI - XII',
    'Others'
  ];

  List tutorlist = [];
  List finalclasslist = [];

  Map<Object?, Object?> tutor_1to5 = {};
  Map<Object?, Object?> tutor_6to8 = {};
  Map<Object?, Object?> tutor_9to10 = {};
  Map<Object?, Object?> tutor_11to12 = {};
  List tutorlist_1to5 = [];
  List tutorlist_6to8 = [];
  List tutorlist_9to10 = [];
  List tutorlist_11to12 = [];
  List tutordetail_1to5 = [];
  List tutordetail_6to8 = [];
  List tutordetail_9to10 = [];
  List tutordetail_11to12 = [];

  @override
  void initState() {
    log(widget.classlist.toString());
    fetch_alldata();

    super.initState();
  }

  fetch_alldata() {
    widget.classlist.forEach((key, value) {
      finalclasslist.add(key);
      tutorlist.add(value);
    });
    log(tutorlist.toString());

    tutor_9to10 = tutorlist[0];
    tutor_1to5 = tutorlist[1];
    tutor_6to8 = tutorlist[2];
    tutor_11to12 = tutorlist[3];

    // Class 1 to 5
    tutor_1to5.forEach((key, value) {
      tutorlist_1to5.add(key);

      tutordetail_1to5.add(value);
    });
    if (tutorlist_1to5.length == 1) {
      setState(() {
        tutorlist_1to5 = [];
        tutordetail_1to5 = [];
      });
    } else {
      int index = tutorlist_1to5.indexOf("notutor");

      tutorlist_1to5.remove(tutorlist_1to5[index]);
      tutordetail_1to5.remove(tutordetail_1to5[index]);
    }
    // Class 6 to 8
    tutor_6to8.forEach((key, value) {
      tutorlist_6to8.add(key);
      tutordetail_6to8.add(value);
    });
    if (tutorlist_6to8.length == 1) {
      setState(() {
        tutorlist_6to8 = [];
        tutordetail_6to8 = [];
      });
    } else {
      int index = tutorlist_6to8.indexOf("notutor");

      tutorlist_6to8.remove(tutorlist_6to8[index]);
      tutordetail_6to8.remove(tutordetail_6to8[index]);
    }
    log(tutor_9to10.toString());
    // Class 9 to 10
    tutor_9to10.forEach((key, value) {
      tutorlist_9to10.add(key);
      tutordetail_9to10.add(value);
    });
    if (tutorlist_9to10.length == 1) {
      setState(() {
        tutorlist_9to10 = [];
        tutordetail_9to10 = [];
      });
    } else {
      int index = tutorlist_9to10.indexOf("notutor");

      tutorlist_9to10.remove(tutorlist_9to10[index]);
      tutordetail_9to10.remove(tutordetail_9to10[index]);
    }

    // Class 11 to 12
    tutor_11to12.forEach((key, value) {
      tutorlist_11to12.add(key);
      tutordetail_11to12.add(value);
    });
    if (tutorlist_11to12.length == 1) {
      setState(() {
        tutorlist_11to12 = [];
        tutordetail_11to12 = [];
      });
    } else {
      int index = tutorlist_11to12.indexOf("notutor");

      tutorlist_11to12.remove(tutorlist_11to12[index]);
      tutordetail_11to12.remove(tutordetail_11to12[index]);
    }
  }

  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 180, 207),
        title: Text(
          widget.subjectname,
          style: regularTextStyle4.copyWith(
              fontSize: MediaQuery.of(context).size.width > 600 ? 25 : 18),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 37,
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 3.13,
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: Image.network(
                          widget.image,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        )),
                    SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Icon(
                                      Icons.cast_for_education_outlined,
                                      color: Colors.blueAccent,
                                      size: MediaQuery.of(context).size.width >
                                              600
                                          ? 15
                                          : 30,
                                    ),
                                  ),
                                  const Text(
                                    "Select Your Class Category:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 5, 5, 5),
                                    ),
                                  ),
                                ],
                              ),
                              DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: DropdownButton2<String>(
                                    dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    isDense: true,
                                    dropdownWidth: 150,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    value: itemvalue2,
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Select",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    600
                                                ? 25
                                                : 14),
                                      ),
                                    ),
                                    items: listitem.map((item2) {
                                      return DropdownMenuItem<String>(
                                          value: item2,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              item2,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepPurple,
                                              ),
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (String? newchange1) {
                                      switch (newchange1) {
                                        case "Class I - V":
                                          {
                                            setState(() {
                                              teacherlist = Container(
                                                  child: Tutorlist(
                                                tutorlist: tutorlist_1to5,
                                                tutordetail: tutordetail_1to5,
                                                image: widget.image,
                                              ));
                                            });
                                          }
                                          break;

                                        case "Class VI - VIII":
                                          {
                                            setState(() {
                                              teacherlist = Container(
                                                  child: Tutorlist(
                                                tutorlist: tutorlist_6to8,
                                                tutordetail: tutordetail_6to8,
                                                image: widget.image,
                                              ));
                                            });
                                          }
                                          break;
                                        case "Class IX - X":
                                          {
                                            setState(() {
                                              teacherlist = Container(
                                                  child: Tutorlist(
                                                tutorlist: tutorlist_9to10,
                                                tutordetail: tutordetail_9to10,
                                                image: widget.image,
                                              ));
                                            });
                                          }
                                          break;
                                        case "Class XI - XII":
                                          {
                                            setState(() {
                                              teacherlist = Container(
                                                  child: Tutorlist(
                                                tutorlist: tutorlist_11to12,
                                                tutordetail: tutordetail_11to12,
                                                image: widget.image,
                                              ));
                                            });
                                          }
                                          break;
                                        case "Others":
                                          {
                                            setState(() {
                                              teacherlist = Container(
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    "COMING SOON..",
                                                    style:
                                                        TextStyle(fontSize: 25),
                                                  ));
                                            });
                                          }
                                          break;
                                      }
                                      log(newchange1!);
                                      setState(() {
                                        itemvalue2 = newchange1;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 50,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Center(child: teacherlist)
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
