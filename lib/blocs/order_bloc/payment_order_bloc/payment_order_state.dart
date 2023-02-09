import 'package:equatable/equatable.dart';

class PaymentOrderState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PaymentOrderLoadingState extends PaymentOrderState {}

class PaymentOrderResultState extends PaymentOrderState {
  final bool isSuccess;
  final String? messsage;
  PaymentOrderResultState(this.isSuccess, this.messsage);
  @override
  // TODO: implement props
  List<Object?> get props => [isSuccess, messsage];
}
