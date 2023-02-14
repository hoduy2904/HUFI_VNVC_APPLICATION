import 'package:equatable/equatable.dart';

enum ForgotPasswordStatus { unknown, loading, success, error }

class ForgotPasswordState extends Equatable {
  final String phoneNumber;
  final String message;
  final ForgotPasswordStatus status;
  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.unknown,
    this.phoneNumber = '',
    this.message = '',
  });
  ForgotPasswordState copyWith(
      {String? phoneNumber,
      String? message,
      bool? isSubmit,
      ForgotPasswordStatus? status}) {
    return ForgotPasswordState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        message: message ?? this.message,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [phoneNumber, status, message];
}
