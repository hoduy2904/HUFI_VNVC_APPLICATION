import 'package:flutter/cupertino.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_state.dart';
import 'package:hufi_vnvc_application/models/province_model.dart';

class ProvinceStatus extends ProfileState {
  final Status status;
  final String? message;
  final List<ProvinceModel>? provinces;
  final int? codeSelect;
  bool get isValidateProvince => codeSelect != null;

  const ProvinceStatus(
      {this.status = Status.LOADING,
      this.provinces,
      this.message,
      this.codeSelect});

  ProvinceStatus copyFrom(
      {Status? status,
      String? message,
      List<ProvinceModel>? provinces,
      int? codeSelect}) {
    return ProvinceStatus(
        status: status ?? this.status,
        message: message ?? this.message,
        provinces: provinces ?? this.provinces,
        codeSelect: codeSelect ?? this.codeSelect);
  }

  @override
  List<Object?> get props => [status, message, provinces, codeSelect];
}
