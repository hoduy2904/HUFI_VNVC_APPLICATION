import 'package:equatable/equatable.dart';

class PaymentOrderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnPayClickEvent extends PaymentOrderEvent {
  final int selectId;
  OnPayClickEvent({required this.selectId});
  @override
  List<Object?> get props => [selectId];
}
