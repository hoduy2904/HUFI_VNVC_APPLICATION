import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_bloc.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnCheckLoginEvent extends AuthEvent {}

class OnLogoutEvent extends AuthEvent {}

class AuthenticationStatusChanged extends AuthEvent {
  final AuthStatus status;
  AuthenticationStatusChanged({required this.status});
}
