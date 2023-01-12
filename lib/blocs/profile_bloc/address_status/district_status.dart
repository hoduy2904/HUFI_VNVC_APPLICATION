import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_state.dart';
import 'package:hufi_vnvc_application/models/district_model.dart';

class DistrictStatus extends ProfileState {
  final Status status;
  final String? message;
  final List<DistrictModel> districts;
  final int? codeSelect;
  bool get isValidateDictrict => codeSelect != null;
  const DistrictStatus(
      {this.status = Status.LOADING,
      this.districts = const [],
      this.message,
      this.codeSelect});

  DistrictStatus copyFrom(
      {Status? status,
      String? message,
      List<DistrictModel>? districts,
      int? codeSelect}) {
    return DistrictStatus(
        status: status ?? this.status,
        message: message ?? this.message,
        districts: districts ?? this.districts,
        codeSelect: codeSelect ?? this.codeSelect);
  }

  @override
  List<Object?> get props => [status, message, districts, codeSelect];
}
