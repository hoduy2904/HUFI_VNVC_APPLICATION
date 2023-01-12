import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnLoadBannerEvent extends HomeEvent {}

class OnLoadCategoryEvent extends HomeEvent {}

class OnLoadProductEvent extends HomeEvent {
  final int categoryId;
  OnLoadProductEvent({required this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}

class OnClickCategoryEvent extends HomeEvent {
  final int id;
  OnClickCategoryEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
