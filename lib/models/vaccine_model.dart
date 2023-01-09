import 'dart:convert';

List<VaccineModel> vaccineFromJson(String str) =>
    List<VaccineModel>.from(jsonDecode(str));

class VaccineModel {
  final int id;
  final int categoryId;
  final String images;
  final String name;
  final String prevention;
  final double price;
  final double priceOld;
  const VaccineModel(this.id, this.categoryId, this.images, this.name,
      this.prevention, this.price, this.priceOld);

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return VaccineModel(json["id"], json["categoryId"], json["images"],
        json["name"], json["prevention"], json["price"], json["priceOld"]);
  }
}
