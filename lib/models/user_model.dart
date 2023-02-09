class UserModel {
  final String username;
  final bool isLock;
  final bool isValidate;
  final int customerId;
  final String customerName;
  final String? avatar;
  final int id;
  final DateTime created;
  UserModel(
      {required this.username,
      required this.isLock,
      required this.isValidate,
      required this.customerId,
      required this.customerName,
      this.avatar,
      required this.id,
      required this.created});

  UserModel.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        isLock = json["isLock"],
        isValidate = json["isValidate"],
        customerId = json["customerId"],
        customerName = json["customerName"],
        avatar = json["avatar"],
        id = json["id"],
        created = DateTime.parse(json["created"]);

  Map<String, dynamic> toJson() => {
        'username': username,
        'isLock': isLock,
        'isValidate': isValidate,
        'customerId': customerId,
        'customerName': customerName,
        'avatar': avatar,
        'id': id,
        'created': created.toIso8601String(),
      };
}
