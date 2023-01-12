import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/home_bloc/home_event.dart';
import 'package:hufi_vnvc_application/blocs/home_bloc/home_state.dart';
import 'package:hufi_vnvc_application/repositories/banner_repository.dart';
import 'package:hufi_vnvc_application/repositories/category_vaccine_repository.dart';
import 'package:hufi_vnvc_application/repositories/product_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initialState()) {
    on<OnLoadBannerEvent>((event, emit) async {
      emit(BannerLoadingState());
      try {
        var banners = await BannerRepository().getBanners();
        emit(state.copyWith(
            bannerSuccessState: BannerSuccessState(banners: banners)));
      } catch (e) {
        emit(BannerFailedState(error: e.toString()));
      }
    });
    on<OnLoadCategoryEvent>((event, emit) async {
      emit(CategoryLoaddingState());
      try {
        var categories = await CategoryVaccineRepository().getCategories();
        emit(state.copyWith(
            categorySuccessState: CategorySuccessState(
                categories: categories, currentId: categories.first.id)));
      } catch (e) {
        CategoryFailedState(error: e.toString());
      }
    });
    on<OnLoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        var vaccines = await ProductRepository().getVaccines(page: 1, size: 20);
        emit(state.copyWith(
            productSuccessState: ProductSuccessState(vaccines: vaccines)));
      } catch (e) {
        emit(ProductFaliledState(error: e.toString()));
      }
    });
    on<OnClickCategoryEvent>((event, emit) async {
      emit(state.copyWith(
          categorySuccessState:
              state.categorySuccessState?.copyFrom(currentId: event.id)));
    });
  }
}
