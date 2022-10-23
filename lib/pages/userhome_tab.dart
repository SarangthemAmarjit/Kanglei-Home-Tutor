import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form1/Refactor/carousel_image.dart';
import 'package:form1/logic/Fetchdatacubit/fetch_data_cubit.dart';
import 'package:form1/pages/sidemenu.dart';
import 'package:form1/pages/widgets/subject_item.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserhomescreentabPage extends StatefulWidget {
  const UserhomescreentabPage({Key? key}) : super(key: key);

  @override
  State<UserhomescreentabPage> createState() => _HomePageState();
}

class _HomePageState extends State<UserhomescreentabPage> {
  String userna = '';
  String databaseString = "";

  List titleList = [];
  List logoList = [];
  List classlist = [];

  @override
  void initState() {
    super.initState();
    context.read<FetchDataCubit>().gethometutordata();
    log('tablet');
  }

  int _current = 0;
  TextEditingController phoneNumber = TextEditingController();
  Color appbarbgcolor = const Color.fromARGB(255, 40, 180, 207);

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.aspectRatio.toString());
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
        drawer: const NavDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 174, 248, 244),
                Color.fromARGB(255, 203, 244, 249),
                Color.fromARGB(255, 255, 254, 254),
                Color.fromARGB(255, 252, 252, 228),
                Color.fromARGB(255, 249, 237, 249),
                Color.fromARGB(255, 255, 254, 254),
              ],
            ),
          ),
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverLayoutBuilder(builder: (context, constraints) {
                final scrolled = constraints.scrollOffset >
                    MediaQuery.of(context).size.width / 2.77;
                return SliverAppBar(
                    elevation: 5,
                    backgroundColor: scrolled
                        ? const Color.fromARGB(255, 40, 180, 207)
                        : const Color.fromARGB(255, 252, 252, 228),
                    snap: false,
                    pinned: true,
                    floating: false,
                    flexibleSpace: LayoutBuilder(
                        builder: (context, BoxConstraints constraints) {
                      var top = constraints.biggest.height;

                      return FlexibleSpaceBar(
                        background: Scaffold(
                          drawer: const NavDrawer(),
                          appBar: AppBar(
                            title: Text(
                              'Kanglei Home Tutor',
                              style: regularTextStyle8,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 40, 180, 207),
                          ),
                          body: SafeArea(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 174, 248, 244),
                                    Color.fromARGB(255, 203, 244, 249),
                                    Color.fromARGB(255, 255, 254, 254),
                                    Color.fromARGB(255, 252, 252, 228),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 10
                                            : 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 43,
                                      width: MediaQuery.of(context).size.width,
                                      child: TextFormField(
                                        showCursor: false,
                                        focusNode: FocusNode(),
                                        autofocus: false,
                                        onTap: () {
                                          FocusScopeNode currentFocus =
                                              FocusScope.of(context);

                                          currentFocus.unfocus();

                                          context.router.push(
                                              SearchsubjectRoute(
                                                  logolist: logoList,
                                                  titlelist: titleList,
                                                  tutordetail: classlist));
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.only(top: 7),
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          hintText: 'Search Your Course',
                                          hintStyle: regularTextStyle2,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 10
                                            : 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 15),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Want To Be Home Tutor ?",
                                                style: regularTextStyle7,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  context.router.push(
                                                      const UseraddPersonRoute());
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 150,
                                                  child: Image.asset(
                                                    'assets/images/click.gif',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 10
                                            : 5,
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
                                        height:
                                            MediaQuery.of(context).size.width /
                                                4.16,
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

                                  //Subject
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: edge),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Subject',
                                            style: blackTextStyle.copyWith(
                                                fontSize: 25),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: edge),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 245, 228, 213),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context.router.push(
                                                      AllsubjectRoute(
                                                          logolist: logoList,
                                                          titlelist: titleList,
                                                          classlist:
                                                              classlist));
                                                },
                                                child: const Text('See all',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.orange)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        title: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: top > 71 && top < 91 ? 1.0 : 0.0,
                            child: Text(
                              top > 71 && top < 91 ? "All Subjects" : "",
                              style: regularTextStyle8,
                            )), //Text
                        //Images.network
                      );
                    }), //FlexibleSpaceBar
                    expandedHeight: MediaQuery.of(context).size.width / 2.33

                    //<Widget>[]
                    );
              }),
              //SliverAppBar
              SliverToBoxAdapter(
                child: titleList.isEmpty
                    ? const SizedBox(
                        height: 300,
                        child: SpinKitSquareCircle(
                          size: 20,
                          color: Colors.amber,
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(
                            top: 5, left: 100, right: 100, bottom: 100),
                        physics: const BouncingScrollPhysics(),
                        itemCount: titleList.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 40,
                                mainAxisSpacing: 40),
                        itemBuilder: (ctx, index) {
                          return InkWell(
                              onTap: () {
                                context.router.push(ClassRoute(
                                    image: logoList[index],
                                    subjectname: titleList[index],
                                    classlist: classlist[index]));
                              },
                              child: SubjectItem(
                                name: titleList[index],
                                imageUrl: logoList[index],
                              ));
                        }),
              ),
            ],
          ),
        ));
  }
}
