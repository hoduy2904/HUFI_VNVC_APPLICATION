import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BannerLoadingState extends HomeState {}

class BannerSuccessState extends HomeState {
  final List<String> banners;
  BannerSuccessState({this.banners = const []});
  @override
  List<Object?> get props => [banners];
}

class BannerFailedState extends HomeState {
  final String error;
  BannerFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}
