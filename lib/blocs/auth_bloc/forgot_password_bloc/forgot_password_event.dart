import 'package:equatable/equatable.dart';

class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnChangePhoneNumber extends ForgotPasswordEvent {
  final String phoneNumber;
  OnChangePhoneNumber({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}

class OnSubmitForgotEvent extends ForgotPasswordEvent {}
