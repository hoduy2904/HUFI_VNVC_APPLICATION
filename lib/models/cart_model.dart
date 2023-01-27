import 'package:hufi_vnvc_application/models/vaccine_model.dart';

class CartModel {
  final int? vaccineId;
  final int id;
  final int? packageId;
  final VaccineModel? vaccineModel;
  CartModel(
      {this.vaccineId, this.packageId, required this.id, this.vaccineModel});
  factory CartModel.fromJson(Map<String, dynamic> json) {
    if (json["vaccine"] != null) {
      VaccineModel vaccineModel = VaccineModel.fromJson(json["vaccine"]);
      return CartModel(
          vaccineId: json["vaccineId"],
          id: json["id"],
          packageId: json["packageId"],
          vaccineModel: vaccineModel);
    }
    return CartModel(
        vaccineId: json["vaccineId"],
        id: json["id"],
        packageId: json["packageId"],
        vaccineModel: null);
  }
}
