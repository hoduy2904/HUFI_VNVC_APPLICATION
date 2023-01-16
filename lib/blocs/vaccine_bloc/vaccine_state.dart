import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';

class VaccineState extends Equatable {
  final VaccineSuccessState? vaccineSuccessState;
  final CategorySuccessState? categorySuccessState;
  const VaccineState({this.vaccineSuccessState, this.categorySuccessState});
  @override
  List<Object?> get props => [vaccineSuccessState, categorySuccessState];

  factory VaccineState.initialState() => VaccineState(
      vaccineSuccessState: const VaccineSuccessState(),
      categorySuccessState: CategorySuccessState());

  VaccineState copyWith(
      {VaccineSuccessState? vaccineSuccessState,
      CategorySuccessState? categorySuccessState}) {
    return VaccineState(
        vaccineSuccessState: vaccineSuccessState ?? this.vaccineSuccessState,
        categorySuccessState:
            categorySuccessState ?? this.categorySuccessState);
  }
}

class CategoryLoaddingState extends VaccineState {}

class CategorySuccessState extends VaccineState {
  final int? currentId;
  List<VaccineCategoryModel> categories;
  CategorySuccessState({this.currentId, this.categories = const []});
  @override
  List<Object?> get props => [categories, currentId];

  CategorySuccessState copyFrom(
      {int? currentId, List<VaccineCategoryModel>? categories}) {
    return CategorySuccessState(
        currentId: currentId = currentId ?? this.currentId,
        categories: categories = categories ?? this.categories);
  }
}

class CategoryFailedState extends VaccineState {
  final String error;
  const CategoryFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}

class VaccineLoadingState extends VaccineState {}

class VaccineSuccessState extends VaccineState {
  final List<VaccineModel> vaccines;
  const VaccineSuccessState({this.vaccines = const []});
  @override
  List<Object?> get props => [vaccines];
}

class VaccineFaliledState extends VaccineState {
  final String error;
  const VaccineFaliledState({required this.error});
  @override
  List<Object?> get props => [error];
}
