import 'package:equatable/equatable.dart';

class HistoryBuyDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnLoadHistoryBuyDetailsEvent extends HistoryBuyDetailsEvent {
  final int injectionScheduleId;
  OnLoadHistoryBuyDetailsEvent({required this.injectionScheduleId});
  @override
  List<Object?> get props => [injectionScheduleId];
}
