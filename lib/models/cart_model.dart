import 'package:hufi_vnvc_application/models/vaccine_model.dart';

class CartModel {
  final int number;
  final int id;
  final VaccineModel vaccineModel;
  CartModel(
      {required this.number, required this.id, required this.vaccineModel});
  factory CartModel.fromJson(Map<String, dynamic> json) {
    VaccineModel vaccineModel = {} as VaccineModel;
    if (json["vaccines"] != null) {
      vaccineModel = json["vaccines"] as VaccineModel;
    }
    return CartModel(
        number: json["number"], id: json["id"], vaccineModel: vaccineModel);
  }
}
