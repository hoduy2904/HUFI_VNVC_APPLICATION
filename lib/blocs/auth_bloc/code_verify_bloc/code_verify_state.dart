import 'dart:math';

import 'package:equatable/equatable.dart';

class CodeVerifyState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CodeVerifyInitState extends CodeVerifyState {}

class CodeVerifyLoadingState extends CodeVerifyState {}

class CodeVerifySuccessState extends CodeVerifyState {}

class CodeVerifyFailedState extends CodeVerifyState {
  final String error;
  CodeVerifyFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
