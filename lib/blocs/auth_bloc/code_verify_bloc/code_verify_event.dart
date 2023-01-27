import 'package:equatable/equatable.dart';

class CodeVerifyEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnClickVerifyEvent extends CodeVerifyEvent {
  final String code;
  OnClickVerifyEvent({required this.code});
  @override
  // TODO: implement props
  List<Object?> get props => [code];
}

class OnResendCodeEvent extends CodeVerifyEvent {
  final int userId;
  OnResendCodeEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}
