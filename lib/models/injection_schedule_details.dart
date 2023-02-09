class InjectionScheduleDetails {
  int? id;
  DateTime? created;
  DateTime? injectionTime;
  DateTime? scheduleTime;
  String? vaccineName;
  String? vaccinePackageName;
  int injections;
  int amount;
  String address;
  int? injectionStaffId;
  int? vaccineId;
  int injectionScheduleId;
  int? vaccinePackageId;
  int shipmentId;
  String? shipmentCode;
  bool pay;
  InjectionScheduleDetails(
      {this.pay = false,
      this.id,
      this.created,
      this.injectionTime,
      this.vaccinePackageName,
      this.scheduleTime,
      this.vaccineName,
      required this.injections,
      required this.amount,
      required this.address,
      required this.injectionScheduleId,
      this.shipmentCode,
      this.injectionStaffId,
      required this.shipmentId,
      this.vaccineId,
      this.vaccinePackageId});

  InjectionScheduleDetails.fromJson(Map<String, dynamic> json)
      : address = json["address"],
        pay = json["pay"],
        id = json["id"],
        created = DateTime.parse(json["created"]),
        injectionTime = json["injectionTime"] == null
            ? null
            : DateTime.parse(json["injectionTime"]),
        vaccineName = json["vaccineName"],
        vaccinePackageName = json["vaccinePackageName"],
        scheduleTime = json["scheduleTime"] == null
            ? null
            : DateTime.parse(json["scheduleTime"]),
        injections = json["injections"] ?? 0,
        amount = json["amout"] ?? 0,
        injectionStaffId = json["injectionStaffId"],
        vaccineId = json["vaccineId"],
        injectionScheduleId = json["injectionScheduleId"],
        vaccinePackageId = json["vaccinePackageId"],
        shipmentCode = json["shipmentCode"],
        shipmentId = json["shipmentId"];

  Map<String, dynamic> toJson() => {
        "injections": injections,
        "amount": amount,
        "address": address,
        "injection": false,
        "pay": false,
        "injectionStaffId": injectionStaffId,
        "vaccineId": vaccineId,
        "injectionScheduleId": injectionScheduleId,
        "vaccinePackageId": vaccinePackageId,
        "shipmentId": shipmentId,
      };
}
