import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/vaccine_package_model.dart';

enum VaccinePackageStatus {
  Loading,
  Success,
  Error,
}

class VaccinePackageState extends Equatable {
  final VaccinePackageStatus? status;
  final List<VaccinePackageModel> vaccinePackages;
  final int currentPage;
  final bool isEndPage;
  final String search;
  final String? message;
  const VaccinePackageState(
      {this.search = '',
      this.message,
      this.isEndPage = false,
      this.vaccinePackages = const [],
      this.status,
      this.currentPage = 1});
  @override
  List<Object?> get props =>
      [search, vaccinePackages, status, currentPage, isEndPage, message];

  factory VaccinePackageState.initialState() => const VaccinePackageState(
      search: '',
      isEndPage: false,
      status: VaccinePackageStatus.Loading,
      vaccinePackages: [],
      currentPage: 1);

  VaccinePackageState copyWith(
      {bool? isEndPage,
      String? search,
      VaccinePackageStatus? status,
      String? message,
      List<VaccinePackageModel>? vaccinePackages,
      int? currentPage}) {
    return VaccinePackageState(
        search: search ?? this.search,
        isEndPage: isEndPage ?? this.isEndPage,
        status: status ?? this.status,
        vaccinePackages: vaccinePackages ?? this.vaccinePackages,
        currentPage: currentPage ?? this.currentPage);
  }
}
