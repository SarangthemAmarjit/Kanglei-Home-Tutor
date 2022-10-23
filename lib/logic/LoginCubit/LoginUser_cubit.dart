import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form1/listener/auth_login_listener.dart';
import 'package:form1/repo/auth_repository.dart';

part 'LoginUser_state.dart';

class LoginCubit extends Cubit<LoginUserState> implements AuthLoginListener {
  final _authRepository = AuthRepository();
  LoginCubit(LoginUserState initialState) : super(initialState);

  void loginUser({required String email, required String password}) {
    _authRepository.loginUser(
        email: email, password: password, authLoginListener: this);
  }

  @override
  void error() {
    ;
    emit(LoginUserState.error);
  }

  @override
  void loaded() {
    emit(LoginUserState.loaded);
  }

  @override
  void loading() {
    emit(LoginUserState.loading);
  }

  @override
  void nointernet() {
    emit(LoginUserState.nointernet);
  }

  void showToast5() {
    Fluttertoast.showToast(
        msg: 'PASSWORD RESET LINK SENT! CHECK YOUR EMAIL',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: const Color.fromARGB(255, 247, 15, 73),
        textColor: const Color.fromARGB(255, 253, 255, 254));
  }
}
