import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnChangePhoneNumberEvent extends LoginEvent {
  final String phoneNumber;
  OnChangePhoneNumberEvent({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}

class OnChangePasswordEvent extends LoginEvent {
  final String password;
  OnChangePasswordEvent({required this.password});
  @override
  List<Object?> get props => [password];
}

class OnClickLoginEvent extends LoginEvent {
  final String? fcmToken;
  OnClickLoginEvent({this.fcmToken});
  @override
  List<Object?> get props => [fcmToken];
}

class OnShowPasswordEvent extends LoginEvent {}
