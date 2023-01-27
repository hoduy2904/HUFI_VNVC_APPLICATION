import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnCheckLoginEvent extends AuthEvent {}

class OnLogoutEvent extends AuthEvent {}
