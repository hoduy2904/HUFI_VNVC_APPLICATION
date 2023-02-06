import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_state.dart';
import 'package:hufi_vnvc_application/repositories/auth_repository.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordState.initialState()) {
    on<OnChangeOldPasswordEvent>((event, emit) async => emit(state.copyWith(
        oldPassword: event.passsword, passwordChangingState: null)));
    on<OnChangePasswordEvent>((event, emit) async => emit(state.copyWith(
        password: event.passsword, passwordChangingState: null)));
    on<OnChangePasswordRepeatEvent>((event, emit) async => emit(state.copyWith(
        repeatPassword: event.passswordRepeat, passwordChangingState: null)));
    on<OnClickChangePassEvent>((event, emit) async {
      if (!state.confirmValidate) {
        emit(state.copyWith(
            isSubmit: true,
            passwordChangingState: const PasswordChangingState(
                isSuccess: false, message: "Password phai giong nhau")));
      } else {
        try {
          var response = await AuthRepository().changePassword(
              oldPassword: state.oldPassword!, newPassword: state.password!);
          if (response.isSuccess) {
            emit(state.copyWith(
                isSubmit: true,
                passwordChangingState: const PasswordChangingState(
                    isSuccess: true, message: "ok")));
          } else {
            emit(state.copyWith(
                isSubmit: true,
                passwordChangingState: PasswordChangingState(
                    isSuccess: false, message: response.messages.first)));
          }
        } catch (e) {
          emit(state.copyWith(
              isSubmit: true,
              passwordChangingState: PasswordChangingState(
                  isSuccess: false, message: e.toString())));
        }
      }
    });
    on<OnShowOldPasswordEvent>((event, emit) =>
        emit(state.copyWith(isShowOldPassword: !state.isShowOldPassword)));
    on<OnShowPasswordEvent>((event, emit) async =>
        emit(state.copyWith(isShowPassword: !state.isShowPassword)));
    on<OnShowRepeatPasswordEvent>((event, emit) => emit(
        state.copyWith(isShowRepeatPassword: !state.isShowRepeatPassword)));
  }
}
