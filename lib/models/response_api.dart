class ResponseAPI {
  final int statusCode;
  final List<String>? message;
  final bool isSuccess;
  final dynamic? data;
  ResponseAPI(
      {required this.statusCode,
      required this.message,
      required this.isSuccess,
      required this.data});
}
