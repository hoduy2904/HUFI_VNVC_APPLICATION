import 'package:equatable/equatable.dart';

class CodeVerifyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CodeVerifyInitState extends CodeVerifyState {}

class CodeVerifyLoadingState extends CodeVerifyState {}

class CodeVerifySuccessState extends CodeVerifyState {}

class CodeVerifyFailedState extends CodeVerifyState {
  final String error;
  CodeVerifyFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}
