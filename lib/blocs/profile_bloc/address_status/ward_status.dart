import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_state.dart';
import 'package:hufi_vnvc_application/models/ward_model.dart';

class WardStatus extends ProfileState {
  final Status status;
  final String? message;
  final List<WardModel> wards;
  final int? codeSelect;
  bool get isValidateWard => codeSelect != null;
  const WardStatus(
      {this.status = Status.LOADING,
      this.wards = const [],
      this.message,
      this.codeSelect});
  WardStatus copyFrom(
      {Status? status,
      String? message,
      List<WardModel>? wards,
      int? codeSelect}) {
    return WardStatus(
        status: status ?? this.status,
        message: message ?? this.message,
        wards: wards ?? this.wards,
        codeSelect: codeSelect ?? this.codeSelect);
  }

  @override
  List<Object?> get props => [status, message, wards, codeSelect];
}
