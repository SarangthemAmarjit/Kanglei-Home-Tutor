import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form1/pages/widgets/subject_item.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/theme.dart';

class AllsubjectPage extends StatefulWidget {
  List<dynamic> titlelist;
  List<dynamic> logolist;
  List<dynamic> classlist;
  AllsubjectPage(
      {Key? key,
      required this.titlelist,
      required this.logolist,
      required this.classlist})
      : super(key: key);

  @override
  State<AllsubjectPage> createState() => _AllsubjectPageState();
}

class _AllsubjectPageState extends State<AllsubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 180, 207),
        title: Text(
          'All Subjects',
          style: regularTextStyle4,
        ),
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
        child: GridView.builder(
            itemCount: widget.titlelist.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  context.router.push(ClassRoute(
                      image: widget.logolist[index],
                      subjectname: widget.titlelist[index],
                      classlist: widget.classlist[index]));
                },
                child: SubjectItem(
                  name: widget.titlelist[index],
                  imageUrl: widget.logolist[index],
                ),
              );
            }),
      ),
    );
  }
}
