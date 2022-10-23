import 'dart:developer';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form1/pages/userhome_tab.dart';
import 'package:form1/pages/userhome_phone.dart';
import 'package:form1/pages/user_account.dart';
import 'package:form1/user/user_requestlist.dart';

class UserNavbarPage extends StatefulWidget {
  final int? screenwidth;
  const UserNavbarPage({Key? key, this.screenwidth}) : super(key: key);

  @override
  State<UserNavbarPage> createState() => _BottomNavbarItemState();
}

class _BottomNavbarItemState extends State<UserNavbarPage> {
  @override
  void initState() {
    setState(() {
      currentselectedindex = 0;
    });

    log('dashboard');
    super.initState();
  }

  List<Widget> itm = [
    const UserhomescreenPage(),
    const UserRequestlistPage(),
    const AccoutPage(),
  ];
  List<Widget> itm2 = [
    const UserhomescreentabPage(),
    const UserRequestlistPage(),
    const AccoutPage(),
  ];

  int currentselectedindex = 0;

  void _ontap(int index) {
    setState(() {
      currentselectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
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
        bottomNavigationBar: BottomNavyBar(
          showElevation: true,
          selectedIndex: currentselectedindex,
          items: [
            BottomNavyBarItem(
                inactiveColor: Colors.blue,
                activeColor: const Color.fromARGB(255, 248, 180, 78),
                icon: const Icon(Icons.home),
                title: const Text('Home')),
            BottomNavyBarItem(
                inactiveColor: Colors.blue,
                activeColor: const Color.fromARGB(255, 248, 180, 78),
                icon: const Icon(Icons.notification_add_sharp),
                title: const Text('Notification')),
            BottomNavyBarItem(
                inactiveColor: Colors.blue,
                activeColor: const Color.fromARGB(255, 248, 180, 78),
                icon: const Icon(Icons.person),
                title: const Text('Account')),
          ],
          iconSize: 30,
          onItemSelected: _ontap,
        ),
        body: Center(
            child: widget.screenwidth! > 600
                ? itm2.elementAt(currentselectedindex)
                : itm.elementAt(currentselectedindex)),
      ),
    );
  }
}
