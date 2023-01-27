import 'package:equatable/equatable.dart';

class VaccineEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadCategoryEvent extends VaccineEvent {}

class OnLoadProductEvent extends VaccineEvent {
  final String? search;
  OnLoadProductEvent({this.search});
  @override
  List<Object?> get props => [search];
}

class OnClickCategoryEvent extends VaccineEvent {
  final int id;
  OnClickCategoryEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class OnClickAddToCartVaccineEvent extends VaccineEvent {
  final int id;
  OnClickAddToCartVaccineEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
