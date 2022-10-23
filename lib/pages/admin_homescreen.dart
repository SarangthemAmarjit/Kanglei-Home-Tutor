import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form1/Refactor/carousel_image.dart';
import 'package:form1/logic/Fetchdatacubit/fetch_data_cubit.dart';
import 'package:form1/pages/widgets/subject_item.dart';

import 'package:form1/router/router.gr.dart';
import 'package:form1/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdminHomeScreenPage extends StatefulWidget {
  @override
  State<AdminHomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<AdminHomeScreenPage> {
  String userna = '';
  late DatabaseReference _dbrefADMIN;
  TextEditingController phonenumbercontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<FetchDataCubit>().gethometutordata();
  }

  int _current = 0;
  Widget build(BuildContext context) {
    List titleList = [];
    List logoList = [];
    List classlist = [];
    var c = context.watch<FetchDataCubit>();
    var data = c.state.hometutordata;
    data.forEach((key, value) {
      titleList.add(key); //get title
      logoList.add(data[key]["logo"]); //get logo
      classlist.add(data[key]["data"]);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 180, 207),
        title: Image.asset(
          'assets/images/admin.png',
          scale: 3.5,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.all(5),
              child: GestureDetector(
                  onTap: () {
                    context.router.push(AdminReqestRoute());
                  },
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ))),
          Padding(
              padding: EdgeInsets.all(9),
              child: GestureDetector(
                  onTap: () {
                    context.router.push(const AdminaddPersonRoute());
                  },
                  child: const Icon(
                    Icons.person_add,
                    color: Colors.black,
                  ))),
          Padding(
              padding: EdgeInsets.all(5),
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
                                _dbrefADMIN = FirebaseDatabase.instance
                                    .ref("hometutorAdmin");
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
      body: SafeArea(
        bottom: false,
        child: Container(
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
          child: Column(
            children: [
              Expanded(
                flex: MediaQuery.of(context).size.height.toInt() * 20,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              showCursor: false,
                              focusNode: FocusNode(),
                              autofocus: false,
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                currentFocus.unfocus();

                                context.router.push(SearchsubjectRoute(
                                    logolist: logoList,
                                    titlelist: titleList,
                                    tutordetail: classlist));
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                hintText: 'Search Your Course',
                                hintStyle: regularTextStyle2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CarouselSlider(
                          items: const [
                            CarouselImage(
                                image:
                                    'https://firebasestorage.googleapis.com/v0/b/fir-project2-fb36d.appspot.com/o/carousel%2Fmain_carousel2ok.jpg?alt=media&token=e2f81119-b0cf-4b68-b0dd-2094150b9cb3'),
                            CarouselImage(
                                image:
                                    'https://firebasestorage.googleapis.com/v0/b/fir-project2-fb36d.appspot.com/o/carousel%2Fneedok.jpg?alt=media&token=1d5c532b-0d58-47b4-82e8-e4968fccb4f6'),
                            CarouselImage(
                                image:
                                    'https://firebasestorage.googleapis.com/v0/b/fir-project2-fb36d.appspot.com/o/carousel%2Fmeitei_mayekok.jpg?alt=media&token=34a7e2bb-a501-4fb1-bf0f-fc4e8ed3a2f9'),
                            CarouselImage(
                                image:
                                    'https://firebasestorage.googleapis.com/v0/b/fir-project2-fb36d.appspot.com/o/carousel%2Fmathsok.jpg?alt=media&token=2580f26d-6ab3-475a-91c1-1bba4f8c9c5d'),
                            CarouselImage(
                                image:
                                    'https://firebasestorage.googleapis.com/v0/b/fir-project2-fb36d.appspot.com/o/carousel%2Fslide1.png?alt=media&token=b6c3a7fe-4951-4ef5-996c-ee39455da933'),
                          ],
                          options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              viewportFraction: 0.95,
                              height: 200,
                              onPageChanged: (i, r) {
                                setState(() {
                                  _current = i;
                                });
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: AnimatedSmoothIndicator(
                            activeIndex: _current,
                            count: 5,
                            effect: const WormEffect(
                                spacing: 8.0,
                                radius: 2.0,
                                dotWidth: 7.0,
                                dotHeight: 7.0,
                                paintStyle: PaintingStyle.stroke,
                                strokeWidth: 1.5,
                                activeDotColor: Colors.pinkAccent),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Subject
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: edge),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Subject',
                                  style: blackTextStyle.copyWith(fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: edge),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 245, 228, 213),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.router.push(AllsubjectRoute(
                                            logolist: logoList,
                                            titlelist: titleList,
                                            classlist: classlist));
                                      },
                                      child: const Text('See all',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.orange)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: MediaQuery.of(context).size.height.toInt() * 19,
                child: titleList.isEmpty
                    ? const Center(
                        child: SpinKitSquareCircle(
                          size: 20,
                          color: Colors.amber,
                        ),
                      )
                    : SizedBox(
                        child: GridView.builder(
                            itemCount: titleList.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  context.router.push(ClassRoute(
                                      image: logoList[index],
                                      subjectname: titleList[index],
                                      classlist: classlist[index]));
                                },
                                child: SubjectItem(
                                    name: titleList[index],
                                    imageUrl: logoList[index]),
                              );
                            }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
