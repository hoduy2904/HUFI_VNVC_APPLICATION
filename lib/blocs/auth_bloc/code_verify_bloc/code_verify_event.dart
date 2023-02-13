import 'package:equatable/equatable.dart';

class CodeVerifyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnClickVerifyEvent extends CodeVerifyEvent {
  final String code;
  final String username;
  OnClickVerifyEvent({required this.username, required this.code});
  @override
  List<Object?> get props => [code];
}

class OnResendCodeEvent extends CodeVerifyEvent {
  final String username;
  OnResendCodeEvent({required this.username});
  @override
  List<Object?> get props => [username];
}

class OnLoadRegisterEvent extends CodeVerifyEvent {
  final String phoneNumber;
  OnLoadRegisterEvent({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}
