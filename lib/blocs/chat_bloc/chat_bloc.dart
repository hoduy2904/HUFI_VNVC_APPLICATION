import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/chat_bloc/chat_event.dart';
import 'package:hufi_vnvc_application/blocs/chat_bloc/chat_state.dart';
import 'package:hufi_vnvc_application/models/chat_model.dart';
import 'package:hufi_vnvc_application/repositories/chat_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.initital()) {
    on<OnSendMessageEvent>((event, emit) async {
      try {
        state.chats.insert(
            0,
            ChatModel(
                message: event.chat, isYou: true, timeSend: DateTime.now()));

        emit(state.copyWith(status: ChatStatus.SendSuccess));
        state.chats.insert(
            0,
            ChatModel(
                message: "chatting-reciving",
                isYou: false,
                timeSend: DateTime.now()));
        emit(state.copyWith(status: ChatStatus.Reciving));
        var response = await ChatRepository()
            .sendChat(message: event.chat, token: event.chatAPI);
        state.chats.removeAt(0);
        state.chats.insert(
            0,
            ChatModel(
                message: response, isYou: false, timeSend: DateTime.now()));
        emit(state.copyWith(status: ChatStatus.Recived));
      } catch (e) {
        state.chats.insert(
            0,
            ChatModel(
                message:
                    "Hiện tại đang quá tải, vui lòng thử lại sau, xin lỗi vì sự cố này, có vấn đề gì hãy gọi hotline của trung tâm VNVC, xin cảm ơn.",
                isYou: false,
                timeSend: DateTime.now()));
        emit(state.copyWith(status: ChatStatus.SendFailed));
      }
    });
  }
}
