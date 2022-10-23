part of 'register_user_cubit.dart';

enum RegisterUserState {
  loading,
  success,
  user_exists,
  weak_password,
  failed,
  initial,
  nointernet
}

class LoginState extends Equatable {
  const LoginState({required this.status});
  final RegisterUserState status;
  @override
  List<Object?> get props => [status];
}
