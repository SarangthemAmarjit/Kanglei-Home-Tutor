import 'dart:developer';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/theme.dart';
import 'package:open_mail_app/open_mail_app.dart';

import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: 'Home Tutor Services',
      backgroundColor: Colors.white,
      elevation: 50,
      width: MediaQuery.of(context).size.width > 600
          ? 300
          : MediaQuery.of(context).size.width / 1.7,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(top: 40),
            decoration: const BoxDecoration(
                image: DecorationImage(
              opacity: 0.5,
              image: AssetImage('assets/images/sidemenukangla.jpg'),
            )),
            child: Center(
                child: Text(
              'Kanglei Home Tutor',
              style: regularTextStyle6,
            )),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);

              context.router.push(UserNavbarRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () async {
              Navigator.pop(context);
              EmailContent email = EmailContent(
                to: [
                  'sarangthemamarjit123@gmail.com.com',
                ],
                subject: 'Sending Feeback for Kanglei Home Tutor App',
              );

              OpenMailAppResult result =
                  await OpenMailApp.composeNewEmailInMailApp(
                      nativePickerTitle: 'Select email app to compose',
                      emailContent: email);
              if (!result.didOpen && !result.canOpen) {
                showNoMailAppsDialog(context);
              } else if (!result.didOpen && result.canOpen) {
                showDialog(
                  context: context,
                  builder: (_) => MailAppPickerDialog(
                    mailApps: result.options,
                    emailContent: email,
                  ),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share App'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About App'),
            onTap: () => {
              Navigator.pop(context),
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.black,
                  title: const Text(
                    'About App',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: const Text(
                    'This App Provides the Services for both Students and Tutors\nApp Version : 1.2.2',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('CANCEL'),
                    ),
                  ],
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Contact'),
            onTap: () => {
              Navigator.pop(context),
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.black,
                  title: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: const Text(
                    'For more information and query please contact me at sarangthemamarjit123@gmail.com 7005191566',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('CANCEL'),
                    ),
                  ],
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () => {
              Navigator.pop(context),
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.black,
                  title: const Text(
                    'Exit App',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: const Text('Do you want to exit an App?',
                      style: TextStyle(color: Colors.white)),
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
              )
            },
          ),
        ],
      ),
    );
  }
}
