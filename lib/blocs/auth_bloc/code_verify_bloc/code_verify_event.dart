import 'package:equatable/equatable.dart';

class CodeVerifyEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnClickVerifyEvent extends CodeVerifyEvent {
  final String code;
  final String username;
  OnClickVerifyEvent({required this.username, required this.code});
  @override
  // TODO: implement props
  List<Object?> get props => [code];
}

class OnResendCodeEvent extends CodeVerifyEvent {
  final String username;
  OnResendCodeEvent({required this.username});
  @override
  // TODO: implement props
  List<Object?> get props => [username];
}

class OnLoadRegisterEvent extends CodeVerifyEvent {
  final String phoneNumber;
  OnLoadRegisterEvent({required this.phoneNumber});
  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber];
}
