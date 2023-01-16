import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_event.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/repositories/category_vaccine_repository.dart';
import 'package:hufi_vnvc_application/repositories/product_repository.dart';

class VaccineBloc extends Bloc<VaccineEvent, VaccineState> {
  VaccineBloc() : super(VaccineState.initialState()) {
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
      emit(VaccineLoadingState());
      try {
        var vaccines = await ProductRepository().getVaccines(page: 1, size: 20);
        emit(state.copyWith(
            vaccineSuccessState: VaccineSuccessState(vaccines: vaccines)));
      } catch (e) {
        emit(VaccineFaliledState(error: e.toString()));
      }
    });
    on<OnClickCategoryEvent>((event, emit) async {
      emit(state.copyWith(
          categorySuccessState:
              state.categorySuccessState?.copyFrom(currentId: event.id)));
    });
  }
}
