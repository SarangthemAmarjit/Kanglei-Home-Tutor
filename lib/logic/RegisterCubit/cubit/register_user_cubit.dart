import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form1/repo/auth_repository.dart';

import '../../../listener/auth_register_listener.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState>
    implements AuthRegistrationListener {
  final _authRepository = AuthRepository();

  RegisterUserCubit(RegisterUserState initialState) : super(initialState);

  void registerUser({required String email, required String password}) {
    _authRepository.registerUser(
        email: email, password: password, authRegistrationListener: this);
  }

  @override
  void failed() {
    emit(RegisterUserState.initial);
    emit(RegisterUserState.failed);
  }

  @override
  void success() {
    emit(RegisterUserState.success);
  }

  @override
  void userExists() {
    emit(RegisterUserState.initial);
    emit(RegisterUserState.user_exists);
  }

  @override
  void weakPassword() {
    emit(RegisterUserState.initial);
    emit(RegisterUserState.weak_password);
  }

  @override
  void nointernet() {
    emit(RegisterUserState.initial);
    emit(RegisterUserState.nointernet);
  }

  @override
  void loading() {
    emit(RegisterUserState.initial);
    emit(RegisterUserState.loading);
  }
}
