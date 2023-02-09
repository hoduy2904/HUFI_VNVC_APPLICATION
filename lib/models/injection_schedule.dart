class InjectionScheduleModel {
  int? id;
  DateTime created;
  int? staffId;
  int customerId;
  DateTime date;
  int? nominatorId;
  String? note;
  int? priorities;
  int? updaterId;
  bool checkPay;

  InjectionScheduleModel(
      {this.id,
      this.checkPay = false,
      required this.date,
      required this.created,
      this.staffId,
      required this.customerId,
      this.nominatorId,
      this.note,
      this.priorities,
      this.updaterId});

  InjectionScheduleModel.fromJson(Map<String, dynamic> json)
      : created = DateTime.parse(json["created"]),
        date = DateTime.parse(json["date"]),
        id = json["id"],
        staffId = json["staffId"],
        customerId = json["customerId"],
        nominatorId = json["nominatorId"],
        note = json["note"],
        priorities = json["priorities"],
        updaterId = json["updaterId"],
        checkPay = json["checkPay"] ?? false;

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "created": created.toIso8601String(),
        "staffId": staffId,
        "customerId": customerId,
        "nominatorId": nominatorId,
        "note": note,
        "priorities": priorities,
      };
}
