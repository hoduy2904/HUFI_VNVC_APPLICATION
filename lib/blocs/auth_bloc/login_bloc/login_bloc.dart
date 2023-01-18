import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/login_bloc/login_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initialState()) {
    on<OnChangePasswordEvent>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<OnChangePhoneNumberEvent>(
        (event, emit) => emit(state.copyWith(userName: event.phoneNumber)));
    on<OnClickLoginEvent>((event, emit) async {
      emit(state.copyWith(
          loginResultState:
              LoginResultState(status: LoginStatus.Loading, message: '')));
      try {
        emit(state.copyWith(
            loginResultState:
                LoginResultState(status: LoginStatus.NotActive, message: '')));
      } catch (e) {
        emit(state.copyWith(
            loginResultState: LoginResultState(
                status: LoginStatus.Failed, message: e.toString())));
      }
    });
    on<OnShowPasswordEvent>((event, emit) =>
        emit(state.copyWith(isShowPassword: !state.isShowPassword)));
  }
}
