import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/injection_model.dart';

class ScheduleInjectionState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ScheduleInjectionLoadingState extends ScheduleInjectionState {}

class ScheduleInjectionSuccessState extends ScheduleInjectionState {
  final List<InjectionModel> scheduleInjections;
  ScheduleInjectionSuccessState({this.scheduleInjections = const []});
  @override
  // TODO: implement props
  List<Object?> get props => [scheduleInjections];
}

class ScheduleInjectionFailedState extends ScheduleInjectionState {
  final String error;
  ScheduleInjectionFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
