import 'package:equatable/equatable.dart';

class ChangePasswordEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnChangePasswordEvent extends ChangePasswordEvent {
  final String passsword;
  OnChangePasswordEvent({required this.passsword});
  @override
  // TODO: implement props
  List<Object?> get props => [passsword];
}

class OnChangePasswordRepeatEvent extends ChangePasswordEvent {
  final String passswordRepeat;
  OnChangePasswordRepeatEvent({required this.passswordRepeat});
  @override
  // TODO: implement props
  List<Object?> get props => [passswordRepeat];
}

class OnShowPasswordEvent extends ChangePasswordEvent {}

class OnShowRepeatPasswordEvent extends ChangePasswordEvent {}

class OnClickChangePassEvent extends ChangePasswordEvent {}
