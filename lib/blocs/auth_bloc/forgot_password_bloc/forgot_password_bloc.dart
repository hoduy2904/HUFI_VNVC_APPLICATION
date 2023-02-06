import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/forgot_password_bloc/forgot_password_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/forgot_password_bloc/forgot_password_state.dart';
import 'package:hufi_vnvc_application/repositories/auth_repository.dart';

class ForgotBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotBloc() : super(ForgotPasswordState()) {
    on<OnChangePhoneNumber>((event, emit) async {
      emit(state.copyWith(
          phoneNumber: event.phoneNumber,
          message: "",
          status: ForgotPasswordStatus.unknown));
    });
    on<OnSubmitForgotEvent>((event, emit) async {
      emit(
          state.copyWith(status: ForgotPasswordStatus.loading, isSubmit: true));
      try {
        var result = await AuthRepository().checkAccountExits(
            phoneNumber: state.phoneNumber, recoveryPassword: true);
        if (result) {
          emit(state.copyWith(status: ForgotPasswordStatus.success));
        } else {
          emit(state.copyWith(
              status: ForgotPasswordStatus.error,
              message: "Không tồn tại tài khoản này"));
        }
      } catch (e) {
        emit(state.copyWith(
            status: ForgotPasswordStatus.error, message: e.toString()));
      }
    });
  }
}
