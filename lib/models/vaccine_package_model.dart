class VaccinePackageModel {
  final int id;
  final DateTime created;
  final String name;
  final String objectInjection;
  final String content;

  VaccinePackageModel(
      {this.content = '',
      required this.id,
      required this.created,
      required this.name,
      required this.objectInjection});

  VaccinePackageModel.fromJson(Map<String, dynamic> json)
      : content = json["content"] ?? "",
        name = json["name"],
        objectInjection = json["objectInjection"] ?? "",
        created = DateTime.parse(json["created"]),
        id = json["id"];
}
