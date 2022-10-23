import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:form1/Refactor/profilelist.dart';
import 'package:form1/theme.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UserTutordetailPage extends StatelessWidget {
  final Map<Object?, Object?> tutordetail;
  final String image;
  const UserTutordetailPage(
      {Key? key, required this.tutordetail, required this.image})
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 180, 207),
        title: Text(
          'Tutor Profile Detail',
          style: regularTextStyle4.copyWith(
              fontSize: MediaQuery.of(context).size.width > 600 ? 25 : 18),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launch("tel://${tutordetail['contact']}");
        },
        backgroundColor: Color.fromARGB(255, 124, 124, 246),
        child: Icon(Icons.call),
      ),
      body: SafeArea(
          child: Center(
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 245, 250, 251),
                  Color.fromARGB(255, 203, 244, 249),
                  Color.fromARGB(255, 252, 252, 228),
                  Color.fromARGB(255, 249, 237, 249),
                  Color.fromARGB(255, 255, 254, 254),
                ],
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: MediaQuery.of(context).size.height.toInt() * 18,
                    child: SizedBox(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 254, 254, 254),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(60),
                                            bottomRight: Radius.circular(60))),
                                    height: MediaQuery.of(context).size.height /
                                        5.5,
                                    width: MediaQuery.of(context).size.width /
                                        0.98,
                                    child: Image.network(
                                      image,
                                      scale: 2.5,
                                      color: Colors.white.withOpacity(0.4),
                                      colorBlendMode: BlendMode.lighten,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 19,
                                  ),
                                ],
                              ),
                              Container(
                                child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width >
                                            600
                                        ? 50
                                        : MediaQuery.of(context).size.width /
                                            8.7,
                                    backgroundColor:
                                        Color.fromARGB(255, 241, 244, 169),
                                    child: Image.asset(
                                        tutordetail['gender'] == 'Female'
                                            ? 'assets/images/femaleok.png'
                                            : "assets/images/maleprofile.png")),
                              ),
                            ],
                          ),
                          ListTile(
                            title: Center(
                                child: Text(
                              'Name : ' "${tutordetail['name']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: MediaQuery.of(context).size.height.toInt() * 30,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SizedBox(
                        child: Column(
                          children: [
                            ProfileUpdate(
                                text1: 'Contact Number  :',
                                text2: "${tutordetail['contact']}"),
                            ProfileUpdate(
                                text1: 'Address  :',
                                text2: "${tutordetail['address']}"),
                            ProfileUpdate(
                                text1: 'Gender  :',
                                text2: "${tutordetail['gender']}"),
                            ProfileUpdate(
                                text1: 'Experience  :',
                                text2: "${tutordetail['experience']}"),
                            ProfileUpdate(
                                text1: 'Job Type  :',
                                text2: "${tutordetail['jobtype']}"),
                            ProfileUpdate(
                                text1: 'Availability  :',
                                text2: "${tutordetail['availability']}"),
                            ProfileUpdate(
                                text1: 'Prefered work Area  :',
                                text2: "${tutordetail['preferedworkarea']}"),
                            ProfileUpdate(
                                text1: 'Qualification  :',
                                text2: "${tutordetail['qualification']}"),
                            const SizedBox(
                              height: 70,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
