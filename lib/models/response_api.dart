class ResponseAPI {
  final int statusCode;
  final List<String> messages;
  final bool isSuccess;
  final dynamic data;
  ResponseAPI(
      {required this.statusCode,
      required this.messages,
      required this.isSuccess,
      required this.data});

  ResponseAPI.fromJson(Map<String, dynamic> json)
      : statusCode = json['statusCode'],
        messages =
            json["messages"] == null ? [] : List<String>.from(json["messages"]),
        isSuccess = json['isSuccess'],
        data = json['data'];
}
