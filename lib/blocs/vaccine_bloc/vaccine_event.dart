import 'package:equatable/equatable.dart';

class VaccineEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadCategoryEvent extends VaccineEvent {}

class OnLoadProductEvent extends VaccineEvent {
  final int categoryId;
  OnLoadProductEvent({required this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}

class OnClickCategoryEvent extends VaccineEvent {
  final int id;
  OnClickCategoryEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
