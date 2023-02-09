import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_package_bloc/vaccine_package_event.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_package_bloc/vaccine_package_state.dart';
import 'package:hufi_vnvc_application/repositories/product_repository.dart';

class VaccinePackageBloc
    extends Bloc<VaccinePackageEvent, VaccinePackageState> {
  VaccinePackageBloc() : super(VaccinePackageState.initialState()) {
    int pageSize = 10;

    on<OnLoadVaccinePackageEvent>((event, emit) async {
      emit(state.copyWith(
          status: VaccinePackageStatus.Loading, isEndPage: false, message: ''));
      try {
        var vaccinePackage = await ProductRepository()
            .getVaccinesPackages(page: 1, size: pageSize, q: event.search);
        print(inspect(vaccinePackage));
        emit(state.copyWith(
            search: event.search,
            currentPage: 1,
            isEndPage: vaccinePackage.length < pageSize,
            status: VaccinePackageStatus.Success,
            vaccinePackages: vaccinePackage));
      } catch (e) {
        emit(state.copyWith(status: VaccinePackageStatus.Error));
      }
    });

    on<OnFetchVaccinePackageEvent>((event, emit) async {
      try {
        var vaccines = await ProductRepository().getVaccinesPackages(
            page: state.currentPage + 1, size: pageSize, q: state.search);
        if (!state.isEndPage) {
          if (vaccines.length < pageSize) emit(state.copyWith(isEndPage: true));
          emit(state.copyWith(
              status: VaccinePackageStatus.Success,
              currentPage: state.currentPage + 1,
              message: ''));
          state.vaccinePackages.addAll(vaccines);
        }
      } catch (e) {
        emit(state.copyWith(
            status: VaccinePackageStatus.Error, message: e.toString()));
      }
    });
  }
}
