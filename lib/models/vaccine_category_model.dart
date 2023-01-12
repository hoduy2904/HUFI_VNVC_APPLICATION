class VaccineCategoryModel {
  final int id;
  final String name;
  const VaccineCategoryModel({required this.id, required this.name});
  factory VaccineCategoryModel.fromJson(Map<String, dynamic> json) {
    return VaccineCategoryModel(id: json["id"], name: json["name"]);
  }
}
