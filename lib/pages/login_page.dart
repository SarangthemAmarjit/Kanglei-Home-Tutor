import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:form1/pages/widgets/sign_in.dart';
import 'package:form1/pages/widgets/sign_up.dart';
import 'package:form1/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Do you want to go to Main login Page?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.router.replaceNamed('/splashscreen2'),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 174, 248, 244),
                          Color.fromARGB(255, 203, 244, 249),
                          Color.fromARGB(255, 255, 254, 254),
                          Color.fromARGB(255, 239, 239, 201),
                          Color.fromARGB(255, 249, 237, 249),
                          Color.fromARGB(255, 255, 254, 254),
                        ],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 75.0),
                          child: Image(
                              height: MediaQuery.of(context).size.height > 800
                                  ? 191.0
                                  : 115,
                              fit: BoxFit.fill,
                              image: const AssetImage(
                                  'assets/img/login_logo.png')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: 300.0,
                            height: 50.0,
                            decoration: const BoxDecoration(
                              color: Color(0x552B2B2B),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                  labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontFamily: 'WorkSansSemiBold'),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: const BubbleTabIndicator(
                                    indicatorHeight: 40.0,
                                    indicatorColor: Colors.white,
                                    tabBarIndicatorSize:
                                        TabBarIndicatorSize.tab,
                                  ),
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.white,
                                  controller: _tabController,
                                  tabs: const [
                                    Tab(
                                      text: 'Existing',
                                    ),
                                    Tab(
                                      text: 'New',
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 450,
                          child:
                              TabBarView(controller: _tabController, children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints.expand(),
                              child: SignIn(),
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints.expand(),
                              child: SignUp(),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
