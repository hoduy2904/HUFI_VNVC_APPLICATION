class InjectionModel {
  final DateTime dateTime;
  final int number;
  final String location;
  final String vaccineName;
  final String preventive;
  const InjectionModel(this.dateTime, this.number, this.location,
      this.vaccineName, this.preventive);

  factory InjectionModel.fromJson(Map<String, dynamic> json) {
    return InjectionModel(json["dateTime"], json["number"], json["location"],
        json["vaccineName"], json["preventive"]);
  }
}
