import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_event.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/repositories/category_vaccine_repository.dart';
import 'package:hufi_vnvc_application/repositories/product_repository.dart';

class VaccineBloc extends Bloc<VaccineEvent, VaccineState> {
  VaccineBloc() : super(VaccineState.initialState()) {
    on<OnLoadCategoryEvent>((event, emit) async {
      emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineLoading));
      try {
        var categories = await CategoryVaccineRepository().getCategories();
        var vaccines = await ProductRepository().getVaccines(
            page: 1, size: 20, typeOfVaccineId: categories.first.id);
        emit(state.copyWith(
            vaccineStatus: VaccineStatus.VaccineSuccess,
            categorySuccessState: CategorySuccessState(
                categories: categories, currentId: categories.first.id),
            vaccineSuccessState: VaccineSuccessState(vaccines: vaccines)));
      } catch (e) {
        print(e.toString());
        emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineError));
      }
    });
    on<OnLoadProductEvent>((event, emit) async {
      emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineLoading));
      try {
        var vaccines = await ProductRepository().getVaccines(
            page: 1,
            size: 20,
            typeOfVaccineId: state.categorySuccessState!.currentId!,
            q: event.search);
        emit(state.copyWith(
            vaccineStatus: VaccineStatus.VaccineSuccess,
            vaccineSuccessState: VaccineSuccessState(vaccines: vaccines)));
      } catch (e) {
        emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineError));
      }
    });
    on<OnClickCategoryEvent>((event, emit) async {
      emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineLoading));
      try {
        var vaccines = await ProductRepository()
            .getVaccines(page: 1, size: 20, typeOfVaccineId: event.id);
        emit(state.copyWith(
            vaccineStatus: VaccineStatus.VaccineSuccess,
            categorySuccessState:
                state.categorySuccessState?.copyFrom(currentId: event.id),
            vaccineSuccessState: VaccineSuccessState(vaccines: vaccines)));
      } catch (e) {
        emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineError));
      }
    });
  }
}
