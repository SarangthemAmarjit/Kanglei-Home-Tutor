import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form1/admin/admin_requestlist.dart';
import 'package:form1/pages/admin_account.dart';
import 'package:form1/pages/user_account.dart';
import 'package:form1/pages/admin_homescreen.dart';

class AdminNavbarPage extends StatefulWidget {
  @override
  State<AdminNavbarPage> createState() => _BottomNavbarItemState();
}

class _BottomNavbarItemState extends State<AdminNavbarPage> {
  List<Widget> itm = [
    AdminHomeScreenPage(),
    const AdminReqestPage(),
    const AminaccoutPage(),
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
                activeColor: Color.fromARGB(255, 248, 180, 78),
                icon: Icon(Icons.home),
                title: Text('Home')),
            BottomNavyBarItem(
                inactiveColor: Colors.blue,
                activeColor: Color.fromARGB(255, 248, 180, 78),
                icon: Icon(Icons.notification_add_sharp),
                title: const Text('Notification')),
            BottomNavyBarItem(
                inactiveColor: Colors.blue,
                activeColor: Color.fromARGB(255, 248, 180, 78),
                icon: Icon(Icons.person),
                title: Text('Account')),
          ],
          iconSize: 30,
          onItemSelected: _ontap,
        ),
        body: Center(child: itm.elementAt(currentselectedindex)),
      ),
    );
  }
}
