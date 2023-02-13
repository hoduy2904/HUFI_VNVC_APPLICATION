import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/models/vaccine_package_model.dart';
import 'package:hufi_vnvc_application/repositories/product_repository.dart';

class VaccineDetailsBloc
    extends Bloc<VaccineDetailsEvent, VaccineDetailsState> {
  VaccineDetailsBloc() : super(VaccineDetailsState()) {
    on<OnLoadVaccineDetailsEvent>((event, emit) async {
      emit(VaccineDetailsLoadingState());
      try {
        print(event.props);
        if (event.vaccineId != null || event.vaccinePackageId != null) {
          if (event.vaccineId != null) {
            var vaccine =
                await ProductRepository().getVaccine(event.vaccineId!);
            emit(VaccineDetailsSuccessState(vaccine: vaccine));
          } else {
            var vaccinePackage = await ProductRepository()
                .getVaccinePackage(event.vaccinePackageId!);
            inspect(vaccinePackage);
            emit(VaccineDetailsSuccessState(vaccinePackage: vaccinePackage));
          }
        }
      } catch (e) {
        emit(VaccineDetailsFailedState(error: e.toString()));
      }
    });
  }
}

//Event
class VaccineDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnLoadVaccineDetailsEvent extends VaccineDetailsEvent {
  final int? vaccineId;
  final int? vaccinePackageId;
  OnLoadVaccineDetailsEvent({this.vaccinePackageId, this.vaccineId});
  @override
  List<Object?> get props => [vaccineId, vaccinePackageId];
}

//State
class VaccineDetailsState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class VaccineDetailsLoadingState extends VaccineDetailsState {}

class VaccineDetailsSuccessState extends VaccineDetailsState {
  final VaccineModel? vaccine;
  final VaccinePackageModel? vaccinePackage;
  VaccineDetailsSuccessState({this.vaccine, this.vaccinePackage});
  @override
  List<Object?> get props => [vaccine, vaccinePackage];
}

class VaccineDetailsFailedState extends VaccineDetailsState {
  final String error;
  VaccineDetailsFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}
