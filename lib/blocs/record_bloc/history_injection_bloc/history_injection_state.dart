import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/injection_schedule_details.dart';

class HistoryInjectionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HistoryInjectionLoadingState extends HistoryInjectionState {}

class HistoryInjectionSuccessState extends HistoryInjectionState {
  final List<InjectionScheduleDetails> historyInjections;
  HistoryInjectionSuccessState({this.historyInjections = const []});
  @override
  List<Object?> get props => [historyInjections];
}

class HistoryInjectionFailedState extends HistoryInjectionState {
  final String error;
  HistoryInjectionFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}

//Loading for Next Injection
class NextInjectionLoadingState extends HistoryInjectionState {}

class NextInjectionSuccessState extends HistoryInjectionState {
  final List<InjectionScheduleDetails> historyInjections;
  NextInjectionSuccessState({this.historyInjections = const []});
  @override
  List<Object?> get props => [historyInjections];
}

class NextInjectionFailedState extends HistoryInjectionState {
  final String error;
  NextInjectionFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}
