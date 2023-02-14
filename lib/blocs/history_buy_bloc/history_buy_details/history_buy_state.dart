import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/injection_schedule_details.dart';

class HistoryBuyDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HistoryBuyDetailsLoadingState extends HistoryBuyDetailsState {}

class HistoryBuyDetailsSuccessState extends HistoryBuyDetailsState {
  final List<InjectionScheduleDetails> histories;
  HistoryBuyDetailsSuccessState({this.histories = const []});
  @override
  List<Object?> get props => [histories];
}

class HistoryBuyDetailsFailedState extends HistoryBuyDetailsState {
  final String error;
  HistoryBuyDetailsFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}
