import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/logic/Fetchdatacubit/fetch_data_cubit.dart';
import 'package:form1/pages/widgets/subject_item.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/theme.dart';

class SearchsubjectPage extends StatefulWidget {
  final List<dynamic> titlelist;
  final List<dynamic> logolist;
  final List<dynamic> tutordetail;
  const SearchsubjectPage(
      {Key? key,
      required this.titlelist,
      required this.logolist,
      required this.tutordetail})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchsubjectPage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well

  // This list holds the data for the list view
  List<dynamic> _foundUsers = [];
  List<dynamic> _foundUsers2 = [];
  List<dynamic> _foundlogo = [];
  final List _searchResult = [];
  @override
  initState() {
    // at the beginning, all users are shown
    context.read<FetchDataCubit>().gethometutordata();
    _foundUsers = widget.titlelist;
    _foundlogo = widget.logolist;

    super.initState();
  }

  List<String> subjectname = [
    'Meitei Mayek',
    'Mathematics',
    'Science',
    'English',
    'Computer Science',
    'Physics',
    'Chemistry',
    'Biology'
  ];

  // This function is called whenever the text field changes
  _runFilter(String enteredKeyword, Map<dynamic, dynamic> data) {
    log(enteredKeyword);
    List<dynamic> results = [];
    List<dynamic> logo = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        results = widget.titlelist;
        logo = widget.logolist;
      });
    } else {
      setState(() {
        results = widget.titlelist
            .where((user) => user
                .toString()
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        log(results.toString());
      });
      for (var items in results) {
        setState(() {
          logo.add(data[items]["logo"]);
        });
      }
    }

    // Refresh the UI
    setState(() {
      _foundUsers2 = results;
      _foundlogo = logo;
    });
  }

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.width.toString());
    var c = context.watch<FetchDataCubit>();
    var data = c.state.hometutordata;

    return WillPopScope(
      onWillPop: () async {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        return true;
      },
      child: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 30, left: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: InkWell(
                              onTap: () {
                                context.router.pop();
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              child: const Icon(Icons.arrow_back)),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 253, 253, 252),
                              borderRadius: BorderRadius.circular(7)),
                          height: 43,
                          child: TextFormField(
                            cursorHeight: 25,
                            autofocus: true,
                            onChanged: ((value) {
                              _runFilter(value, data);
                            }),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(top: 7),
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                hintText: 'Search Your Course',
                                hintStyle: regularTextStyle2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: _foundUsers2.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: _foundUsers2.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.router.push(ClassRoute(
                                    image: _foundlogo[index],
                                    subjectname: _foundUsers2[index],
                                    classlist: widget.tutordetail[index]));
                              },
                              child: SubjectItem(
                                name: _foundUsers2[index],
                                imageUrl: _foundlogo[index],
                              ),
                            );
                          },
                        )
                      : const Text(
                          'No results found',
                          style: TextStyle(fontSize: 24),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
