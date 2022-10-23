part of 'LoginUser_cubit.dart';

enum LoginUserState { loaded, loading, error, nointernet, initial }

class LoginState extends Equatable {
  const LoginState({this.authresult, required this.status});
  final LoginUserState status;
  final dynamic authresult;
  @override
  List<Object?> get props => [status, authresult];
}
