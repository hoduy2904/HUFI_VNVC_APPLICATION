import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_state.dart';
import 'package:hufi_vnvc_application/models/user_model.dart';
import 'package:hufi_vnvc_application/repositories/auth_repository.dart';
import 'package:hufi_vnvc_application/repositories/customer_repository.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { loading, unAuthentication, authentication }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late StreamSubscription<AuthStatus> _authenticationStatusSubscription;
  AuthBloc() : super(AuthState()) {
    _authenticationStatusSubscription = RequestAPI.instance.status
        .listen((status) => add(AuthenticationStatusChanged(status: status)));
    on<AuthenticationStatusChanged>(((event, emit) async {
      switch (event.status) {
        case AuthStatus.unAuthentication:
          return emit(UnAuthenticationState());
        case AuthStatus.loading:
          return emit(AuthLoading());
        case AuthStatus.authentication:
          var prefs = await SharedPreferences.getInstance();
          var userString = prefs.getString("user");
          var userMd = UserModel.fromJson(jsonDecode(userString!));
          var customer = await CustomerRepository().getCustomerModel(userMd.id);
          return emit(AuthenticationState(user: customer, loginId: userMd.id));
      }
    }));

    on<OnCheckLoginEvent>((event, emit) async {
      emit(AuthLoading());
      var pref = await SharedPreferences.getInstance();
      await Future.delayed(const Duration(seconds: 1));
      if (pref.containsKey("accessToken") && pref.containsKey("user")) {
        var userString = pref.getString("user");
        var userMd = UserModel.fromJson(jsonDecode(userString!));
        var customer = await CustomerRepository().getCustomerModel(userMd.id);
        emit(AuthenticationState(user: customer, loginId: userMd.id));
        pref.setInt("customerId", customer.id);
      } else {
        pref.clear();
        emit(UnAuthenticationState());
      }
    });

    on<OnLogoutEvent>((event, emit) async {
      emit(AuthLoading());
      var prefs = await SharedPreferences.getInstance();
      if (!(prefs.containsKey("accessToken") &&
          prefs.containsKey("refreshToken") &&
          prefs.containsKey("user"))) {
        prefs.clear();
        emit(UnAuthenticationState());
      } else {
        var accessToken = prefs.getString("accessToken");
        var refreshToken = prefs.getString("refreshToken");
        var userString = prefs.getString("user");
        var user = UserModel.fromJson(jsonDecode(userString!));
        try {
          var res = await AuthRepository().Logout(accessToken!, refreshToken!);
          if (res.isSuccess) {
            await FirebaseMessaging.instance
                .unsubscribeFromTopic("device-${user.id}");
            await FirebaseMessaging.instance.unsubscribeFromTopic("all");
            await prefs.clear();
            emit(UnAuthenticationState());
          } else {
            emit(AuthFailedState(error: res.messages.first));
          }
        } catch (e) {
          emit(AuthFailedState(error: e.toString()));
        }
      }
    });
  }
  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }
}
