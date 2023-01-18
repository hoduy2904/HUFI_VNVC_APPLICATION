import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthenticationState extends AuthState {}

class UnAuthenticationState extends AuthState {}

class AuthLoading extends AuthState {}
