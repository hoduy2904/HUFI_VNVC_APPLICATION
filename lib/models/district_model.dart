import 'package:hufi_vnvc_application/models/base_address.dart';
import 'package:hufi_vnvc_application/models/ward_model.dart';

class DistrictModel extends BaseAddress {
  final int provinceCode;
  final List<WardModel> wards;

  const DistrictModel(
      {required String name,
      required int code,
      required String codeName,
      required String divisionType,
      required this.provinceCode,
      required this.wards})
      : super(
            name: name,
            code: code,
            codeName: codeName,
            divisionType: divisionType);

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return DistrictModel(
        name: json["name"],
        code: json["code"],
        codeName: json["codename"],
        divisionType: json["division_type"],
        provinceCode: json["province_code"],
        wards: json["wards"] as List<WardModel>);
  }
}
