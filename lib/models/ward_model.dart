import 'package:hufi_vnvc_application/models/base_address.dart';

class WardModel extends BaseAddress {
  final int districtCode;

  const WardModel(
      {required String name,
      required int code,
      required String codeName,
      required String divisionType,
      required this.districtCode})
      : super(
            name: name,
            code: code,
            codeName: codeName,
            divisionType: divisionType);

  factory WardModel.fromJson(Map<String, dynamic> json) {
    return WardModel(
        name: json["name"],
        code: json["code"],
        codeName: json["codename"],
        divisionType: json["division_type"],
        districtCode: json["district_code"]);
  }
}
