import 'package:equatable/equatable.dart';

class PeopleOrderEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadPeopleOrderEvent extends PeopleOrderEvent {}

class OnSearchPeopleOrderEvent extends PeopleOrderEvent {
  final String query;
  OnSearchPeopleOrderEvent({required this.query});
  @override
  // TODO: implement props
  List<Object?> get props => [query];
}
