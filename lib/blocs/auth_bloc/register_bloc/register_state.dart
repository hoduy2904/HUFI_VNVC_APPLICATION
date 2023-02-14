import 'package:equatable/equatable.dart';

enum RegisterStatus { loading, success, failed, exits }

class RegisterState extends Equatable {
  final RegisterResultState? registerResultState;
  final String? userName;
  final String? password;
  final bool isSubmit;
  final String verificationRecived;
  bool get validatePassword => password!.length > 5;
  final String? repeatPassword;
  bool get validateRepeatPassword =>
      repeatPassword!.length > 5 && repeatPassword == password;
  bool get validateForm =>
      validatePassword && validateRepeatPassword && password == repeatPassword;
  final bool isShowPassword;
  final bool isShowRepeatPassword;
  const RegisterState(
      {this.isSubmit = false,
      this.verificationRecived = '',
      this.repeatPassword,
      this.isShowRepeatPassword = false,
      this.isShowPassword = false,
      this.registerResultState,
      this.userName,
      this.password});
  factory RegisterState.initialState() => const RegisterState(
      verificationRecived: '',
      userName: '',
      password: '',
      isShowPassword: false,
      repeatPassword: '',
      isShowRepeatPassword: false);

  RegisterState copyWith(
      {bool? isSubmit,
      String? verificationRecived,
      String? repeatPassword,
      bool? isShowRepeatPassword,
      bool? isShowPassword,
      RegisterResultState? registerResultState,
      String? userName,
      String? password}) {
    return RegisterState(
        isSubmit: isSubmit ?? this.isSubmit,
        verificationRecived: verificationRecived ?? this.verificationRecived,
        repeatPassword: repeatPassword ?? this.repeatPassword,
        isShowRepeatPassword: isShowRepeatPassword ?? this.isShowRepeatPassword,
        isShowPassword: isShowPassword ?? this.isShowPassword,
        registerResultState: registerResultState ?? this.registerResultState,
        userName: userName ?? this.userName,
        password: password ?? this.password);
  }

  @override
  List<Object?> get props => [
        isSubmit,
        userName,
        password,
        registerResultState,
        verificationRecived,
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
  List<Object?> get props => [status, message];
}
