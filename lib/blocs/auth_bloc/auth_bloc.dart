import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_state.dart';
import 'package:hufi_vnvc_application/models/user_model.dart';
import 'package:hufi_vnvc_application/repositories/auth_repository.dart';
import 'package:hufi_vnvc_application/repositories/customer_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<OnCheckLoginEvent>((event, emit) async {
      emit(AuthLoading());
      var pref = await SharedPreferences.getInstance();
      await Future.delayed(const Duration(seconds: 2));
      if (pref.containsKey("accessToken")) {
        var userString = pref.getString("user");
        var userMd = UserModel.fromJson(jsonDecode(userString!));
        var customer = await CustomerRepository().getCustomerModel(userMd.id);
        emit(AuthenticationState(user: customer));
        pref.setInt("customerId", customer.id);
      } else {
        emit(UnAuthenticationState());
      }
    });
    on<OnLogoutEvent>((event, emit) async {
      var prefs = await SharedPreferences.getInstance();
      var accessToken = prefs.getString("accessToken");
      var refreshToken = prefs.getString("refreshToken");

      try {
        var res = await AuthRepository().Logout(accessToken!, refreshToken!);
        if (res.isSuccess) {
          await prefs.clear();
          emit(UnAuthenticationState());
        } else {
          emit(AuthFailedState(error: res.messages.first));
        }
      } catch (e) {
        emit(AuthFailedState(error: e.toString()));
      }
    });
  }
}
