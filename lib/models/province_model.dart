import 'dart:convert';

import 'package:flutter_application_1/models/base_address.dart';
import 'package:flutter_application_1/models/district_model.dart';

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
    return ProvinceModel(
        name: json["name"],
        code: json["code"],
        codeName: json["codename"],
        divisionType: json["division_type"],
        phoneCode: json["phone_code"],
        districts: []);
  }
}
