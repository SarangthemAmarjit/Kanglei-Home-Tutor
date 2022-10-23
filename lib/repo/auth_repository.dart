import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form1/listener/auth_login_listener.dart';
import 'package:form1/listener/auth_register_listener.dart';
import 'package:form1/services/auth.dart';

class AuthRepository {
  final AuthService _auth = AuthService();

  void loginUser(
      {required String email,
      required String password,
      required AuthLoginListener authLoginListener}) async {
    authLoginListener.loading();
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        dynamic authresult =
            await _auth.signInwithemailandPassword(email, password);
        if (authresult == null) {
          authLoginListener.error();
        } else {
          authLoginListener.loaded();
        }
      }
    } on SocketException catch (_) {
      authLoginListener.nointernet();
    }
  }

  void registerUser(
      {required String email,
      required String password,
      required AuthRegistrationListener authRegistrationListener}) async {
    authRegistrationListener.loading();
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        dynamic result =
            await _auth.registerwithemailandPassword(email, password);
        if (result == null) {
          authRegistrationListener.failed();
        } else {
          authRegistrationListener.success();
        }
      } else {
        authRegistrationListener.nointernet();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        authRegistrationListener.weakPassword();
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        authRegistrationListener.userExists();
      }
    }
  }
}
