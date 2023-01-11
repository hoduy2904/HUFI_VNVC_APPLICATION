import 'dart:convert';

import 'package:hufi_vnvc_application/models/base_address.dart';
import 'package:hufi_vnvc_application/models/district_model.dart';

class ProvinceModel extends BaseAddress {
  final int phoneCode;
  final List<DistrictModel> districts;
  const ProvinceModel(
      {required String name,
      required int code,
      required String codeName,
      required String divisionType,
      required this.phoneCode,
      required this.districts})
      : super(
            name: name,
            code: code,
            codeName: codeName,
            divisionType: divisionType);

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    List<DistrictModel> districts = [];
    if (json["districts"] != null) {
      districts = (json["districts"] as List)
          .map((e) => DistrictModel.fromJson(e))
          .toList();
    }
    return ProvinceModel(
        name: json["name"],
        code: json["code"],
        codeName: json["codename"],
        divisionType: json["division_type"],
        phoneCode: json["phone_code"],
        districts: districts);
  }
}
