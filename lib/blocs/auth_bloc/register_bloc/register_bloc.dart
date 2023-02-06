import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/register_bloc/register_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/register_bloc/register_state.dart';
import 'package:hufi_vnvc_application/repositories/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState.initialState()) {
    on<OnChangePasswordEvent>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<OnChangeRepeatPasswordEvent>(
        (event, emit) => emit(state.copyWith(repeatPassword: event.password)));
    on<OnChangePhoneNumberEvent>(
        (event, emit) => emit(state.copyWith(userName: event.phoneNumber)));
    on<OnClickRegisterEvent>((event, emit) async {
      emit(state.copyWith(isSubmit: true));
      if (state.validateForm) {
        emit(state.copyWith(
            registerResultState: const RegisterResultState(
                status: RegisterStatus.Loading, message: '')));
        try {
          var checkAccount = await AuthRepository()
              .checkAccountExits(phoneNumber: state.userName!);
          if (!checkAccount) {
            emit(state.copyWith(
                registerResultState: const RegisterResultState(
                    status: RegisterStatus.Success, message: 'Next step')));
          } else {
            emit(state.copyWith(
                registerResultState: const RegisterResultState(
                    status: RegisterStatus.Failed,
                    message: 'Tài khoản đã tồn tại')));
          }
        } catch (e) {
          emit(state.copyWith(
              registerResultState: RegisterResultState(
                  status: RegisterStatus.Failed, message: e.toString())));
        }
      }
    });
    on<OnShowPasswordEvent>((event, emit) =>
        emit(state.copyWith(isShowPassword: !state.isShowPassword)));
    on<OnShowRepeatPasswordEvent>((event, emit) => emit(
        state.copyWith(isShowRepeatPassword: !state.isShowRepeatPassword)));
  }
}
