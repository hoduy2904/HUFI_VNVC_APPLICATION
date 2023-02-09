import 'dart:convert';

List<VaccineModel> vaccineFromJson(String str) =>
    List<VaccineModel>.from(jsonDecode(str));

class VaccineModel {
  final int id;
  final int categoryId;
  final String images;
  final String name;
  final String prevention;
  final int price;
  final int priceOld;
  final int quantityRemain;
  final String typeOfVaccineName;
  final String content;
  const VaccineModel(
      {this.content = '',
      this.typeOfVaccineName = '',
      required this.quantityRemain,
      required this.id,
      required this.categoryId,
      required this.images,
      required this.name,
      required this.prevention,
      required this.price,
      required this.priceOld});

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    int price = 0, priceOld = 0;
    if (json["vaccinePrices"] != null) {
      try {
        var listPrice = json["vaccinePrices"] as List;
        if (listPrice.isNotEmpty) {
          price = (listPrice[0]["retailPrice"] ?? 0);
          priceOld = (listPrice.length > 0 ? listPrice[1]["retailPrice"] : 0);
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return VaccineModel(
        content: json["content"] ?? "",
        typeOfVaccineName: json["typeOfVaccineName"] ?? "",
        quantityRemain: json["quantityRemain"],
        id: json["id"],
        categoryId: json["typeOfVaccineId"],
        images: json["image"],
        name: json["name"],
        prevention: json["diseasePrevention"],
        price: price,
        priceOld: priceOld);
  }
}
