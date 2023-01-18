import 'dart:math';

import 'package:equatable/equatable.dart';

enum RegisterStatus { Loading, Success, Failed, Exits }

class RegisterState extends Equatable {
  final RegisterResultState? registerResultState;
  final String? userName;
  final String? password;
  final bool isSubmit;
  bool get validatePassword => password!.length > 5;
  final String? repeatPassword;
  bool get validateRepeatPassword => repeatPassword!.length > 5;
  bool get validateForm =>
      validatePassword && validateRepeatPassword && password == repeatPassword;
  final bool isShowPassword;
  final bool isShowRepeatPassword;
  const RegisterState(
      {this.isSubmit = false,
      this.repeatPassword,
      this.isShowRepeatPassword = false,
      this.isShowPassword = false,
      this.registerResultState,
      this.userName,
      this.password});
  factory RegisterState.initialState() => const RegisterState(
      userName: '',
      password: '',
      isShowPassword: false,
      repeatPassword: '',
      isShowRepeatPassword: false);

  RegisterState copyWith(
      {bool? isSubmit,
      String? repeatPassword,
      bool? isShowRepeatPassword,
      bool? isShowPassword,
      RegisterResultState? registerResultState,
      String? userName,
      String? password}) {
    return RegisterState(
        isSubmit: isSubmit ?? this.isSubmit,
        repeatPassword: repeatPassword ?? this.repeatPassword,
        isShowRepeatPassword: isShowRepeatPassword ?? this.isShowRepeatPassword,
        isShowPassword: isShowPassword ?? this.isShowPassword,
        registerResultState: registerResultState ?? this.registerResultState,
        userName: userName ?? this.userName,
        password: password ?? this.password);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        isSubmit,
        userName,
        password,
        registerResultState,
        isShowPassword,
        isShowRepeatPassword,
        repeatPassword
      ];
}

class RegisterResultState extends RegisterState {
  final RegisterStatus status;
  final String message;
  const RegisterResultState({required this.status, required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [status, message];
}
