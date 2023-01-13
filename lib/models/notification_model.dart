class NotificationModel {
  final bool isRead;
  final String content;
  final DateTime time;
  final int id;
  final int? userId;
  const NotificationModel(
      {required this.isRead,
      required this.content,
      required this.time,
      required this.id,
      this.userId});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        isRead: json["isRead"],
        content: json["content"],
        time: json[" time"],
        id: json["id"],
        userId: json["userId"]);
  }
}
