import 'package:equatable/equatable.dart';

class HistoryBuyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnLoadHistoryBuyEvent extends HistoryBuyEvent {
  final String? search;
  OnLoadHistoryBuyEvent({this.search});
  @override
  List<Object?> get props => [search];
}

class OnFetchHistoryBuyEvent extends HistoryBuyEvent {}
