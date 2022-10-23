import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminTutordetailPage extends StatelessWidget {
  final Map<Object?, Object?> tutordetail;
  const AdminTutordetailPage({Key? key, required this.tutordetail})
      : super(key: key);

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launch("tel://${tutordetail['contact']}");
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.call),
      ),
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.account_box,
                      size: 30,
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child:
                          Center(child: Text("Name: ${tutordetail['name']}")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text("Address: ${tutordetail['address']}")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                              "Class Category: ${tutordetail['class_category']}")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text("Gender: ${tutordetail['gender']}")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text("Job type: ${tutordetail['jobtype']}")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child:
                              Text("Experience: ${tutordetail['experience']}")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text("Phone: ${tutordetail['contact']}")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text("Subject: ${tutordetail['subject']}")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                              "Location: ${tutordetail['preferedworkarea']}")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                              "Qualification: ${tutordetail['qualification']}")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                              "Working time: ${tutordetail['availability']}")),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
