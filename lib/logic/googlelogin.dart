import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:form1/Refactor/alertbox.dart';
import 'package:form1/models/user.dart';
import 'package:form1/pages/widgets/snackbar.dart';
import 'package:form1/router/router.gr.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Google_login {
  savemail(email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  Userok? _userFromFirebase(User user) {
    return user != null ? Userok(uid: user.uid) : null;
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> googlesignin(BuildContext context, int screenwidth) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alertbox;
      },
    );
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      Navigator.pop(context);
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication.whenComplete(() {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return alertbox;
          },
        );
      });
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      if (result.user != null) {
        Navigator.pop(context);
        String? mail = result.user!.email;
        User user = result.user!;
        savemail(mail);

        ("HELLO000000 $mail");
        _userFromFirebase(user);
        CustomSnackBar(context, const Text('Login Successfully'), Colors.green);
        context.router.push(UserNavbarRoute(screenwidth: screenwidth));
      }

// if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }
}
