import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {
  final String? password;
  bool get passwordValidate => password != null && password!.length > 5;
  final String? repeatPassword;
  bool get passwordRepeatValidate =>
      repeatPassword != null && repeatPassword!.length > 5;
  final String? oldPassword;
  bool get oldPasswordValidate => oldPassword!.length > 3;
  final bool isSubmit;
  final bool isShowPassword;
  final bool isShowOldPassword;
  final bool isShowRepeatPassword;
  bool get confirmValidate =>
      password == repeatPassword && oldPassword!.length > 3;
  final PasswordChangingState? passwordChangingState;
  const ChangePasswordState(
      {this.oldPassword,
      this.isShowOldPassword = false,
      this.passwordChangingState,
      this.isSubmit = false,
      this.isShowPassword = false,
      this.isShowRepeatPassword = false,
      this.password,
      this.repeatPassword});
  ChangePasswordState copyWith(
      {String? oldPassword,
      bool? isShowOldPassword,
      PasswordChangingState? passwordChangingState,
      bool? isSubmit,
      String? password,
      String? repeatPassword,
      bool? isShowPassword,
      bool? isShowRepeatPassword}) {
    return ChangePasswordState(
        oldPassword: oldPassword ?? this.oldPassword,
        isShowOldPassword: isShowOldPassword ?? this.isShowOldPassword,
        passwordChangingState: passwordChangingState,
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
      oldPassword: "",
      isShowOldPassword: false,
      isShowPassword: false,
      isShowRepeatPassword: false);
  @override
  List<Object?> get props => [
        oldPassword,
        isShowOldPassword,
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
