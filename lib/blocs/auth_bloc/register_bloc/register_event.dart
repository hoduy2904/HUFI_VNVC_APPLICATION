import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnChangePhoneNumberEvent extends RegisterEvent {
  final String phoneNumber;
  OnChangePhoneNumberEvent({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}

class OnChangePasswordEvent extends RegisterEvent {
  final String password;
  OnChangePasswordEvent({required this.password});
  @override
  List<Object?> get props => [password];
}

class OnChangeRepeatPasswordEvent extends RegisterEvent {
  final String password;
  OnChangeRepeatPasswordEvent({required this.password});
  @override
  List<Object?> get props => [password];
}

class OnClickRegisterEvent extends RegisterEvent {}

class OnShowPasswordEvent extends RegisterEvent {}

class OnShowRepeatPasswordEvent extends RegisterEvent {}
