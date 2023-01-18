import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/history_buy_model.dart';

class HistoryBuyState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HistoryBuyLoadingState extends HistoryBuyState {}

class HistoryBuySuccessState extends HistoryBuyState {
  final List<HistoryBuyModel> histories;
  HistoryBuySuccessState({this.histories = const []});
  @override
  // TODO: implement props
  List<Object?> get props => [histories];
}

class HistoryBuyFailedState extends HistoryBuyState {
  final String error;
  HistoryBuyFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
