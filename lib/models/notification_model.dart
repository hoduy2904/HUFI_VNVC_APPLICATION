class NotificationModel {
  final String title;
  final String? image;
  final bool isSeen;
  final String content;
  final DateTime created;
  final int id;
  final int? loginId;
  const NotificationModel(
      {this.image,
      required this.title,
      required this.isSeen,
      required this.content,
      required this.created,
      required this.id,
      this.loginId});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        title: json["title"],
        image: json["image"],
        isSeen: json["isSeen"],
        content: json["content"],
        created: json[" created"],
        id: json["id"],
        loginId: json["loginId"]);
  }
}
