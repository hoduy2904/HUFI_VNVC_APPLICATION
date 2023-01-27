import 'package:equatable/equatable.dart';

class HistoryInjectionEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadHistoryInjectionEvent extends HistoryInjectionEvent {}

class OnLoadNextInjectionEvent extends HistoryInjectionEvent {}
