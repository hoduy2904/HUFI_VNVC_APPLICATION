import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_event.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/repositories/category_vaccine_repository.dart';
import 'package:hufi_vnvc_application/repositories/product_repository.dart';

class VaccineBloc extends Bloc<VaccineEvent, VaccineState> {
  VaccineBloc() : super(VaccineState.initialState()) {
    int pageSize = 10;
    on<OnLoadCategoryEvent>((event, emit) async {
      emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineLoading));
      try {
        var categories = await CategoryVaccineRepository().getCategories();
        var vaccines = await ProductRepository().getVaccines(
            page: 1,
            size: pageSize,
            typeOfVaccineId: categories.first.id,
            q: state.search);
        emit(state.copyWith(
            isEndPage: vaccines.length < 5,
            currentPage: 1,
            vaccineStatus: VaccineStatus.VaccineSuccess,
            categorySuccessState: CategorySuccessState(
                categories: categories, currentId: categories.first.id),
            vaccineSuccessState: VaccineSuccessState(vaccines: vaccines)));
      } catch (e) {
        emit(state.copyWith(
            vaccineStatus: VaccineStatus.VaccineError, isEndPage: false));
      }
    });
    on<OnLoadProductEvent>((event, emit) async {
      emit(state.copyWith(
          vaccineStatus: VaccineStatus.VaccineLoading, isEndPage: false));
      try {
        var vaccines = await ProductRepository().getVaccines(
            page: 1,
            size: pageSize,
            typeOfVaccineId: state.categorySuccessState!.currentId!,
            q: event.search);
        emit(state.copyWith(
            search: event.search,
            currentPage: 1,
            isEndPage: vaccines.length < 5,
            vaccineStatus: VaccineStatus.VaccineSuccess,
            vaccineSuccessState: VaccineSuccessState(vaccines: vaccines)));
      } catch (e) {
        emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineError));
      }
    });
    on<OnClickCategoryEvent>((event, emit) async {
      emit(state.copyWith(
        vaccineStatus: VaccineStatus.VaccineLoading,
        isEndPage: false,
        categorySuccessState:
            state.categorySuccessState?.copyFrom(currentId: event.id),
      ));
      try {
        var vaccines = await ProductRepository().getVaccines(
            page: 1,
            size: pageSize,
            typeOfVaccineId: event.id,
            q: state.search);
        emit(state.copyWith(
            currentPage: 1,
            isEndPage: vaccines.length < 5,
            vaccineStatus: VaccineStatus.VaccineSuccess,
            vaccineSuccessState: VaccineSuccessState(vaccines: vaccines)));
      } catch (e) {
        emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineError));
      }
    });
    on<OnFetchVaccineEvent>((event, emit) async {
      try {
        var vaccines = await ProductRepository().getVaccines(
            page: state.currentPage + 1,
            size: pageSize,
            typeOfVaccineId: state.categorySuccessState!.currentId!,
            q: state.search);
        if (!state.isEndPage) {
          if (vaccines.length < pageSize) emit(state.copyWith(isEndPage: true));
          emit(state.copyWith(
            vaccineStatus: VaccineStatus.VaccineSuccess,
            currentPage: state.currentPage + 1,
          ));
          state.vaccineSuccessState!.vaccines.addAll(vaccines);
        }
      } catch (e) {
        emit(state.copyWith(vaccineStatus: VaccineStatus.VaccineError));
      }
    });
  }
}
