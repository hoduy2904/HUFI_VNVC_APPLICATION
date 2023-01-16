import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordState.initialState()) {
    on<OnChangePasswordEvent>(
        (event, emit) async => emit(state.copyWith(password: event.passsword)));
    on<OnChangePasswordRepeatEvent>((event, emit) async =>
        emit(state.copyWith(repeatPassword: event.passswordRepeat)));
    on<OnClickChangePassEvent>((event, emit) async {
      if (!state.confirmValidate) {
        emit(state.copyWith(
            isSubmit: true,
            passwordChangingState: const PasswordChangingState(
                isSuccess: false, message: "Password phai giong nhau")));
      } else {
        try {
          emit(state.copyWith(
              isSubmit: true,
              passwordChangingState:
                  const PasswordChangingState(isSuccess: true, message: "ok")));
        } catch (e) {
          emit(state.copyWith(
              isSubmit: true,
              passwordChangingState: PasswordChangingState(
                  isSuccess: false, message: e.toString())));
        }
      }
    });
    on<OnShowPasswordEvent>((event, emit) async =>
        emit(state.copyWith(isShowPassword: !state.isShowPassword)));
    on<OnShowRepeatPasswordEvent>((event, emit) => emit(
        state.copyWith(isShowRepeatPassword: !state.isShowRepeatPassword)));
  }
}
