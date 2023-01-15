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
  final int quantityRemain;
  const VaccineModel(
      {required this.quantityRemain,
      required this.id,
      required this.categoryId,
      required this.images,
      required this.name,
      required this.prevention,
      required this.price,
      required this.priceOld});

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return VaccineModel(
        quantityRemain: json["quantityRemain"],
        id: json["id"],
        categoryId: json["typeOfVaccineId"],
        images: json["image"],
        name: json["name"],
        prevention: json["diseasePrevention"],
        price: json["price"],
        priceOld: json["priceOld"]);
  }
}
