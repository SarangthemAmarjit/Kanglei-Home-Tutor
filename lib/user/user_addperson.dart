import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form1/Refactor/addusertextfield.dart';
import 'package:form1/theme.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UseraddPersonPage extends StatefulWidget {
  const UseraddPersonPage({Key? key}) : super(key: key);

  @override
  _AdminaddPersonPageState createState() => _AdminaddPersonPageState();
}

List<String> subjectList = <String>[
  'Select',
  'Biology',
  'Chemistry',
  'Computer Science',
  'English',
  'Mathematics',
  'Meitei Mayek',
  'Physics',
  'Science'
];
List<String> classList = [
  'Select',
  'Class_1to5',
  'Class_6to8',
  'Class_9to10',
  'Class_11to12',
  'Others'
];
List<String> genderList = <String>['Select', 'Male', 'Female', "Others"];
List<String> jobtype = <String>["Select", "Full Time", "Part Time"];

class _AdminaddPersonPageState extends State<UseraddPersonPage> {
  late DatabaseReference _dbref;
  late DatabaseReference _dbref2;

  String dropdownValueGender = genderList.first;
  String dropdownValueJobType = jobtype.first;
  String dropdownValueSubject = subjectList.first;
  String dropdownValueClass = classList.first;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController qualifiController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController availController = TextEditingController();
  TextEditingController prefLocationController = TextEditingController();
  TextEditingController thumbnailUrl = TextEditingController();
  String? genderValue;
  String? jobtypeValue;
  String? subjectValue;
  String? classValue;
  String usermail = '';
  String mailid = '';
  List<String> mailsplit_list = [];

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
    mailsplit_list = usermail.split('@');
    mailid = mailsplit_list[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 180, 207),
        title: Image.asset(
          'assets/images/jointutor_ok.png',
          scale: 2.3,
        ),
        centerTitle: true,
      ),
      body: Stack(alignment: Alignment.topCenter, children: [
        SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 203, 244, 249),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 248, 248, 225),
                  Color.fromARGB(255, 203, 244, 249),
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Addusertextfield(
                      keyboardtype: TextInputType.name,
                      controller: nameController,
                      hintext: 'Full Name',
                      prefixicon: Icons.person),
                  const SizedBox(
                    height: 10,
                  ),
                  Addusertextfield(
                      keyboardtype: TextInputType.streetAddress,
                      controller: addressController,
                      hintext: 'Address',
                      prefixicon: Icons.location_on_rounded),
                  const SizedBox(
                    height: 10,
                  ),
                  Addusertextfield(
                      keyboardtype: TextInputType.phone,
                      controller: phoneNumber,
                      hintext: 'Phone Number',
                      prefixicon: Icons.phone),
                  const SizedBox(
                    height: 10,
                  ),
                  Addusertextfield(
                      keyboardtype: TextInputType.text,
                      controller: qualifiController,
                      hintext: 'Qualification',
                      prefixicon: Icons.cast_for_education),
                  const SizedBox(
                    height: 10,
                  ),
                  Addusertextfield(
                      keyboardtype: TextInputType.text,
                      controller: availController,
                      hintext: 'Availability',
                      prefixicon: Icons.timer_sharp),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose Your Subject :',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                              fontSize: MediaQuery.of(context).size.height > 800
                                  ? 16
                                  : 15),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor:
                                      const Color.fromARGB(255, 236, 250, 217),
                                  alignment: Alignment.center,
                                  menuMaxHeight: 250,
                                  value: dropdownValueSubject,
                                  elevation: 30,
                                  style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValueSubject = value!;
                                      subjectValue = value;
                                    });
                                  },
                                  items: subjectList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose Your Class Category :',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                              fontSize: MediaQuery.of(context).size.height > 800
                                  ? 16
                                  : 15),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.height > 800 ? 10 : 5,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor:
                                      const Color.fromARGB(255, 236, 250, 217),
                                  alignment: Alignment.center,
                                  menuMaxHeight: 250,
                                  value: dropdownValueClass,
                                  elevation: 30,
                                  style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValueClass = value!;
                                      classValue = value;
                                    });
                                  },
                                  items: classList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gender :',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                              fontSize: MediaQuery.of(context).size.height > 800
                                  ? 16
                                  : 15),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.height > 800 ? 10 : 5,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor:
                                      const Color.fromARGB(255, 236, 250, 217),
                                  alignment: Alignment.center,
                                  menuMaxHeight: 250,
                                  value: dropdownValueGender,
                                  elevation: 30,
                                  style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValueGender = value!;
                                      genderValue = value;
                                    });
                                  },
                                  items: genderList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.height > 800 ? 10 : 5,
                        ),
                        Text(
                          'Job Type :',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                              fontSize: MediaQuery.of(context).size.height > 800
                                  ? 16
                                  : 15),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.height > 800 ? 10 : 5,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  borderRadius: BorderRadius.circular(10),
                                  isExpanded: false,
                                  dropdownColor:
                                      Color.fromARGB(255, 236, 250, 217),
                                  alignment: Alignment.center,
                                  menuMaxHeight: 250,
                                  value: dropdownValueJobType,
                                  elevation: 30,
                                  style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValueJobType = value!;
                                      jobtypeValue = value;
                                    });
                                  },
                                  items: jobtype.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Addusertextfield(
                      keyboardtype: TextInputType.text,
                      controller: expController,
                      hintext: 'Experience',
                      prefixicon: Icons.menu_book_outlined),
                  const SizedBox(
                    height: 10,
                  ),
                  Addusertextfield(
                      keyboardtype: TextInputType.text,
                      controller: prefLocationController,
                      hintext: 'Prefered working area',
                      prefixicon: Icons.location_city),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _dbref = FirebaseDatabase.instance.ref("hometutorwwu");

                        if (nameController.value.text == '' ||
                            addressController.value.text == '' ||
                            qualifiController.value.text == '' ||
                            phoneNumber.value.text == '' ||
                            expController.value.text == '' ||
                            availController.value.text == '' ||
                            prefLocationController.value.text == '' ||
                            subjectValue == null ||
                            jobtypeValue == null ||
                            genderValue == null ||
                            jobtypeValue == "Select" ||
                            genderValue == "Select" ||
                            subjectValue == "Select" ||
                            classValue == 'select') {
                          AlertController.show(
                            " Error !!",
                            "All Field Are Required!",
                            TypeAlert.error,
                          );
                        } else if (nameController.value.text.contains('.')) {
                          AlertController.show(
                            " Error !!",
                            "Name Should Be Full Name",
                            TypeAlert.error,
                          );
                        } else if (phoneNumber.value.text.length < 10 ||
                            phoneNumber.value.text.length > 10) {
                          AlertController.show(
                            " Error !!",
                            "Phone Number Should be 10 Digit",
                            TypeAlert.error,
                          );
                        } else {
                          _dbref
                              .child("WWU")
                              .child("data")
                              .child("${nameController.value.text}")
                              .set({
                            "subject": "${subjectValue}",
                            "class_category": "${classValue}",
                            "name": "${nameController.value.text}",
                            "address": "${addressController.value.text}",
                            "emailid": mailid,
                            "contact": "${phoneNumber.value.text}",
                            "qualification": "${qualifiController.value.text}",
                            "gender": "${genderValue}",
                            "jobtype": "${jobtypeValue}",
                            "experience": "${expController.value.text}",
                            "availability": "${availController.value.text}",
                            "preferedworkarea":
                                "${prefLocationController.value.text}",
                          }).whenComplete(() {
                            log('Submitted Successfully');
                            _dbref2 =
                                FirebaseDatabase.instance.ref("requeststatus");
                            _dbref2
                                .child("WWU")
                                .child("data")
                                .child(mailid)
                                .set({
                              "name": nameController.value.text,
                              "request_status": "Pending"
                            }).whenComplete(() {
                              context.router.replaceNamed('/usernavbar');
                              AlertController.show(
                                " Done Submitted",
                                "Successfully!",
                                TypeAlert.success,
                              );
                            });
                          });
                        }
                      },
                      child: const Text("Submit")),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 200),
          child: Image.asset(
            'assets/images/bgimage.png',
            scale: 4,
            color: Colors.white.withOpacity(0.15),
            colorBlendMode: BlendMode.modulate,
          ),
        )
      ]),
    );
  }
}
