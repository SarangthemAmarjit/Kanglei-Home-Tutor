import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/logic/Fetchdatacubit/user_request/cubit/fetch_requestlist_cubit.dart';
import 'package:form1/pages/sidemenu.dart';
import 'package:form1/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRequestlistPage extends StatefulWidget {
  const UserRequestlistPage({Key? key}) : super(key: key);

  @override
  _UserRequestlistPageState createState() => _UserRequestlistPageState();
}

class _UserRequestlistPageState extends State<UserRequestlistPage> {
  String usermail = '';
  String mailid = '';
  List<String> mailsplit_list = [];

  @override
  void initState() {
    super.initState();
    context.read<FetchUserRequestCubit>().getrequestlist();
    checkLogin();
  }

  checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email").toString();
    log(email);
    setState(() {
      usermail = email;
    });
    mailsplit_list = usermail.split('@');
    mailid = mailsplit_list[0];
  }

  late DatabaseReference _dbref;
  late DatabaseReference _dbref2;
  late DatabaseReference _dbref3;
  Widget build(BuildContext context) {
    List titleList = [];
    List sdetails = [];
    List allemailid = [];
    List allrequestdetail = [];
    List emailid = [];
    List requestdetail = [];

    var c = context.watch<FetchUserRequestCubit>();
    String nulldata = c.state.nulldata;

    if (nulldata == "null") {
      allemailid = [];
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
            allemailid.add(key);
            allrequestdetail.add(value);
          });
        }
        if (allemailid.contains(mailid)) {
          int index = allemailid.indexOf(mailid);

          emailid.add(allemailid[index]);
          requestdetail.add(allrequestdetail[index]);
        } else {
          setState(() {
            emailid = [];
          });
        }
      }
    }

    return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 40, 180, 207),
          title: Text("My Request", style: regularTextStyle4),
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
          child: emailid.isEmpty
              ? const Center(
                  child: Text(
                  'No Request Found',
                  style: TextStyle(fontSize: 25),
                ))
              : ListView.builder(
                  itemCount: emailid.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      child: Container(
                          child: ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.amber,
                            )),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${requestdetail[index]["name"]}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${requestdetail[index]["request_status"]}",
                              style: TextStyle(
                                color: requestdetail[index]["request_status"] ==
                                        "Pending"
                                    ? Colors.orange
                                    : const Color.fromARGB(255, 57, 209, 62),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )),
                    );
                  },
                ),
        ));
  }
}
