import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/repositories/product_repository.dart';

class VaccineDetailsBloc
    extends Bloc<VaccineDetailsEvent, VaccineDetailsState> {
  VaccineDetailsBloc() : super(VaccineDetailsState()) {
    on<OnLoadVaccineDetailsEvent>((event, emit) async {
      emit(VaccineDetailsLoadingState());
      try {
        var vaccine = await ProductRepository().getVaccine(event.id);
        emit(VaccineDetailsSuccessState(vaccine: vaccine));
      } catch (e) {
        emit(VaccineDetailsFailedState(error: e.toString()));
      }
    });
  }
}

//Event
class VaccineDetailsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadVaccineDetailsEvent extends VaccineDetailsEvent {
  final int id;
  OnLoadVaccineDetailsEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

//State
class VaccineDetailsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class VaccineDetailsLoadingState extends VaccineDetailsState {}

class VaccineDetailsSuccessState extends VaccineDetailsState {
  final VaccineModel vaccine;
  VaccineDetailsSuccessState({required this.vaccine});
  @override
  // TODO: implement props
  List<Object?> get props => [vaccine];
}

class VaccineDetailsFailedState extends VaccineDetailsState {
  final String error;
  VaccineDetailsFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
