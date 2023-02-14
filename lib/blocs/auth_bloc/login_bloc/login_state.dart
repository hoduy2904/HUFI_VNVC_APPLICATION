import 'package:equatable/equatable.dart';

enum LoginStatus { loading, success, failed, notActive }

class LoginState extends Equatable {
  final LoginResultState? loginResultState;
  final String? userName;
  final String? password;
  final bool isShowPassword;
  const LoginState(
      {this.isShowPassword = false,
      this.loginResultState,
      this.userName,
      this.password});
  factory LoginState.initialState() =>
      const LoginState(userName: '', password: '', isShowPassword: false);

  LoginState copyWith(
      {bool? isShowPassword,
      LoginResultState? loginResultState,
      String? userName,
      String? password}) {
    return LoginState(
        isShowPassword: isShowPassword ?? this.isShowPassword,
        loginResultState: loginResultState ?? this.loginResultState,
        userName: userName ?? this.userName,
        password: password ?? this.password);
  }

  @override
  List<Object?> get props =>
      [userName, password, loginResultState, isShowPassword];
}

class LoginResultState extends LoginState {
  final LoginStatus status;
  final String message;
  const LoginResultState({required this.status, required this.message});
  @override
  List<Object?> get props => [status, message];
}
