import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<OnCheckLoginEvent>((event, emit) async {
      emit(AuthLoading());
      var pref = await SharedPreferences.getInstance();
      if (pref.containsKey("authToken")) {
        emit(AuthenticationState());
      } else {
        emit(UnAuthenticationState());
      }
    });
  }
}
