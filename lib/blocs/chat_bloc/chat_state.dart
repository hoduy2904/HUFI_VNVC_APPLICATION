import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/chat_model.dart';

enum ChatStatus { Sending, SendSuccess, SendFailed, Recived }

class ChatState extends Equatable {
  final List<ChatModel> chats;
  final ChatStatus? status;
  final String? message;
  const ChatState({this.chats = const [], this.status, this.message});
  factory ChatState.initital() => ChatState(chats: [
        ChatModel(
            message:
                "Tôi là bot tên là GPT được đào tạo và phát triển bởi OpenAI. Tin nhắn này sẽ không được lưu lại, vì thế sẽ mất khi bạn thoát khỏi cuộc trò chuyện. Bạn có câu hỏi gì cho tôi không ? ",
            isYou: false,
            timeSend: DateTime.now())
      ]);
  ChatState copyWith(
      {List<ChatModel>? chats, ChatStatus? status, String? message}) {
    return ChatState(
        chats: chats ?? this.chats,
        status: status ?? this.status,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [chats, status, message];
}
