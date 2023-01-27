import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/customer_model.dart';
import 'package:hufi_vnvc_application/models/user_model.dart';

class AuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthenticationState extends AuthState {
  final CustomerModel user;
  AuthenticationState({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class UnAuthenticationState extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailedState extends AuthState {
  final String error;
  AuthFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
