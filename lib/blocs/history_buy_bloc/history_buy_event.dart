import 'package:equatable/equatable.dart';

class HistoryBuyEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadHistoryBuyEvent extends HistoryBuyEvent {
  final String? search;
  OnLoadHistoryBuyEvent({this.search});
  @override
  // TODO: implement props
  List<Object?> get props => [search];
}

class OnFetchHistoryBuyEvent extends HistoryBuyEvent {}
