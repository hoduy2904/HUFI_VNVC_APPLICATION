class ChatModel {
  final String message;
  final bool isYou;
  final DateTime timeSend;
  const ChatModel(
      {required this.message, required this.isYou, required this.timeSend});
}
