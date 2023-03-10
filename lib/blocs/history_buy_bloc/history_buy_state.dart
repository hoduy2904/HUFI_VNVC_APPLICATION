import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/history_buy_model.dart';
import 'package:hufi_vnvc_application/models/injection_schedule.dart';

enum HistoryBuyStatus { Loading, Success, Failed }

class HistoryBuyState extends Equatable {
  final HistoryBuySuccessState? historyBuySuccessState;
  final int currentPage;
  final HistoryBuyStatus? status;
  final String message;
  final bool isEndPage;
  const HistoryBuyState(
      {this.isEndPage = false,
      this.historyBuySuccessState,
      this.currentPage = 1,
      this.status,
      this.message = ''});
  HistoryBuyState copyWith(
      {bool? isEndPage,
      HistoryBuySuccessState? historyBuySuccessState,
      int? currentPage,
      String? message,
      HistoryBuyStatus? status}) {
    return HistoryBuyState(
        isEndPage: isEndPage ?? this.isEndPage,
        historyBuySuccessState:
            historyBuySuccessState ?? this.historyBuySuccessState,
        currentPage: currentPage ?? this.currentPage,
        status: status ?? this.status,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [historyBuySuccessState, currentPage, status, message, isEndPage];
}

class HistoryBuyLoadingState extends HistoryBuyState {}

class HistoryBuySuccessState extends HistoryBuyState {
  final List<InjectionScheduleModel> histories;
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
