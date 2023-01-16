import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {
  final String? password;
  bool get passwordValidate => password != null && password!.length > 6;
  final String? repeatPassword;
  bool get passwordRepeatValidate =>
      repeatPassword != null && repeatPassword!.length > 6;
  final bool isSubmit;
  final bool isShowPassword;
  final bool isShowRepeatPassword;
  bool get confirmValidate => password == repeatPassword;
  final PasswordChangingState? passwordChangingState;
  const ChangePasswordState(
      {this.passwordChangingState,
      this.isSubmit = false,
      this.isShowPassword = false,
      this.isShowRepeatPassword = false,
      this.password,
      this.repeatPassword});
  ChangePasswordState copyWith(
      {PasswordChangingState? passwordChangingState,
      bool? isSubmit,
      String? password,
      String? repeatPassword,
      bool? isShowPassword,
      bool? isShowRepeatPassword}) {
    return ChangePasswordState(
        passwordChangingState:
            passwordChangingState ?? this.passwordChangingState,
        isSubmit: isSubmit ?? this.isSubmit,
        isShowPassword: isShowPassword ?? this.isShowPassword,
        isShowRepeatPassword: isShowRepeatPassword ?? this.isShowRepeatPassword,
        password: password ?? this.password,
        repeatPassword: repeatPassword ?? this.repeatPassword);
  }

  factory ChangePasswordState.initialState() => const ChangePasswordState(
      passwordChangingState:
          PasswordChangingState(isSuccess: false, message: ''),
      isSubmit: false,
      password: "",
      repeatPassword: "",
      isShowPassword: false,
      isShowRepeatPassword: false);
  @override
  List<Object?> get props => [
        password,
        repeatPassword,
        isShowPassword,
        isShowRepeatPassword,
        isSubmit,
        passwordChangingState
      ];
}

class PasswordChangingState extends ChangePasswordState {
  final bool isSuccess;
  final String message;
  const PasswordChangingState({this.isSuccess = false, this.message = ''});
  @override
  List<Object?> get props => [isSuccess, message];
}
