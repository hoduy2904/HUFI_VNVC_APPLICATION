import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/injection_model.dart';

class HistoryInjectionState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HistoryInjectionLoadingState extends HistoryInjectionState {}

class HistoryInjectionSuccessState extends HistoryInjectionState {
  final List<InjectionModel> historyInjections;
  HistoryInjectionSuccessState({this.historyInjections = const []});
  @override
  // TODO: implement props
  List<Object?> get props => [historyInjections];
}

class HistoryInjectionFailedState extends HistoryInjectionState {
  final String error;
  HistoryInjectionFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
