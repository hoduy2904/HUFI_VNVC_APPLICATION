import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnChangePhoneNumberEvent extends LoginEvent {
  final String phoneNumber;
  OnChangePhoneNumberEvent({required this.phoneNumber});
  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber];
}

class OnChangePasswordEvent extends LoginEvent {
  final String password;
  OnChangePasswordEvent({required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class OnClickLoginEvent extends LoginEvent {}

class OnShowPasswordEvent extends LoginEvent {}
