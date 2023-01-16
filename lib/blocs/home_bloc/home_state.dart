import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final BannerSuccessState? bannerSuccessState;
  const HomeState({
    this.bannerSuccessState,
  });
  @override
  List<Object?> get props => [bannerSuccessState];
  factory HomeState.initialState() =>
      const HomeState(bannerSuccessState: BannerSuccessState());
}

class BannerLoadingState extends HomeState {}

class BannerSuccessState extends HomeState {
  final List<String> banners;
  const BannerSuccessState({this.banners = const []});
  @override
  List<Object?> get props => [banners];
}

class BannerFailedState extends HomeState {
  final String error;
  const BannerFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}
