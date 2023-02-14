import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_bloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnCheckLoginEvent extends AuthEvent {}

class OnLogoutEvent extends AuthEvent {}

class AuthenticationStatusChanged extends AuthEvent {
  final AuthStatus status;
  AuthenticationStatusChanged({required this.status});
}
