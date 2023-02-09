import 'package:equatable/equatable.dart';

class HistoryBuyDetailsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadHistoryBuyDetailsEvent extends HistoryBuyDetailsEvent {
  final int injectionScheduleId;
  OnLoadHistoryBuyDetailsEvent({required this.injectionScheduleId});
  @override
  // TODO: implement props
  List<Object?> get props => [injectionScheduleId];
}
