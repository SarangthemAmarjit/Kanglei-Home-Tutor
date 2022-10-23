import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NointernetPage extends StatelessWidget {
  const NointernetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 2.77,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/nointernet.png'),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Ooops!',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'No Internet Connection Found',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Check Your Connection',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  context.router.replaceNamed('/splashscreen2');
                },
                child: Text('Go Back'))
          ],
        ),
      ),
    );
  }
}
