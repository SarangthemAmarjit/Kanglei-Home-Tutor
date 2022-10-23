import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/theme.dart';

class Tutorlist extends StatelessWidget {
  final List<dynamic> tutordetail;
  final List tutorlist;
  final String image;
  const Tutorlist(
      {Key? key,
      required this.tutorlist,
      required this.tutordetail,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 203, 244, 249),
              Color.fromARGB(255, 248, 248, 215),
              Color.fromARGB(255, 251, 222, 251),
              Color.fromARGB(255, 255, 254, 254),
            ],
          ),
        ),
        child: tutorlist.isEmpty
            ? Container(
                color: Colors.white,
                child: Text(
                  'No Teacher Found',
                  style: regularTextStyle5.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.width > 600 ? 25 : 18),
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: tutorlist.length,
                itemBuilder: (c, i) {
                  return InkWell(
                      onTap: () {
                        context.router.push(UserTutordetailRoute(
                            tutordetail: tutordetail[i], image: image));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width >
                                                  600
                                              ? 25
                                              : 15,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(tutordetail[i]
                                                  ['gender'] ==
                                              'Female'
                                          ? 'assets/images/femaleok.png'
                                          : "assets/images/maleprofile.png")),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${tutorlist[i]}",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  600
                                              ? 25
                                              : 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ));
                }));
    ;
  }
}
