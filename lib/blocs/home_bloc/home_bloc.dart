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
        emit(BannerSuccessState(banners: banners));
      } catch (e) {
        emit(BannerFailedState(error: e.toString()));
      }
    });
  }
}
