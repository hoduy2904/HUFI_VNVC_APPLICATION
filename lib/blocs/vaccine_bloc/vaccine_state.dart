import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';

class VaccineState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VaccineLoadingState extends VaccineState {}

class VaccineSuccessState extends VaccineState {
  final List<VaccineModel> vaccines;
  VaccineSuccessState({this.vaccines = const []});
  @override
  // TODO: implement props
  List<Object?> get props => [vaccines];
}

class VaccineFailedState extends VaccineState {
  final String error;
  VaccineFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
