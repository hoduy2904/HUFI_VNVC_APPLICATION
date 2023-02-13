import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/login_bloc/login_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/login_bloc/login_state.dart';
import 'package:hufi_vnvc_application/models/login_model.dart';
import 'package:hufi_vnvc_application/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initialState()) {
    on<OnChangePasswordEvent>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<OnChangePhoneNumberEvent>(
        (event, emit) => emit(state.copyWith(userName: event.phoneNumber)));
    on<OnClickLoginEvent>((event, emit) async {
      emit(state.copyWith(
          loginResultState: const LoginResultState(
              status: LoginStatus.loading, message: '')));
      try {
        var response = await AuthRepository()
            .login("KH${state.userName!}", state.password!, event.fcmToken!);
        if (response.isSuccess && response.statusCode == 200) {
          var login = LoginModel.fromJson(response.data);
          var prefs = await SharedPreferences.getInstance();
          prefs.setString("accessToken_Type", login.accessToken_Type);
          prefs.setString("accessToken", login.accessToken);
          prefs.setString("refreshToken", login.refreshToken);
          prefs.setString("user", jsonEncode(login.user));
          prefs.setString("deviceId", event.fcmToken!);
          emit(state.copyWith(
              loginResultState: const LoginResultState(
                  status: LoginStatus.success, message: "login success")));
        } else if (response.statusCode == 423) {
          emit(state.copyWith(
              loginResultState: LoginResultState(
                  status: LoginStatus.notActive,
                  message: response.messages.first)));
        } else {
          emit(state.copyWith(
              loginResultState: LoginResultState(
                  status: LoginStatus.failed,
                  message: response.messages.first)));
        }
      } catch (e) {
        emit(state.copyWith(
            loginResultState: LoginResultState(
                status: LoginStatus.failed, message: e.toString())));
      }
    });
    on<OnShowPasswordEvent>((event, emit) =>
        emit(state.copyWith(isShowPassword: !state.isShowPassword)));
  }
}
