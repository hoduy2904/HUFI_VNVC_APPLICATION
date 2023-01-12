import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';

class HomeState extends Equatable {
  final BannerSuccessState? bannerSuccessState;
  final ProductSuccessState? productSuccessState;
  final CategorySuccessState? categorySuccessState;
  const HomeState(
      {this.categorySuccessState,
      this.bannerSuccessState,
      this.productSuccessState});
  @override
  List<Object?> get props => [bannerSuccessState, productSuccessState];
  factory HomeState.initialState() => const HomeState(
      bannerSuccessState: BannerSuccessState(),
      productSuccessState: ProductSuccessState());

  HomeState copyWith(
      {BannerSuccessState? bannerSuccessState,
      ProductSuccessState? productSuccessState,
      CategorySuccessState? categorySuccessState}) {
    return HomeState(
        bannerSuccessState: bannerSuccessState ?? this.bannerSuccessState,
        productSuccessState: productSuccessState ?? this.productSuccessState,
        categorySuccessState:
            categorySuccessState ?? this.categorySuccessState);
  }
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

class CategoryLoaddingState extends HomeState {}

class CategorySuccessState extends HomeState {
  final int? currentId;
  final List<VaccineCategoryModel> categories;
  const CategorySuccessState({this.currentId, this.categories = const []});
  @override
  List<Object?> get props => [categories, currentId];

  CategorySuccessState copyFrom(
      {int? currentId, List<VaccineCategoryModel>? categories}) {
    return CategorySuccessState(
        currentId: currentId = currentId ?? this.currentId,
        categories: categories = categories ?? this.categories);
  }
}

class CategoryFailedState extends HomeState {
  final String error;
  const CategoryFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}

class ProductLoadingState extends HomeState {}

class ProductSuccessState extends HomeState {
  final List<VaccineModel> vaccines;
  const ProductSuccessState({this.vaccines = const []});
  @override
  List<Object?> get props => [vaccines];
}

class ProductFaliledState extends HomeState {
  final String error;
  const ProductFaliledState({required this.error});
  @override
  List<Object?> get props => [error];
}
