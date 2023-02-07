import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/chat_bloc/chat_event.dart';
import 'package:hufi_vnvc_application/blocs/chat_bloc/chat_state.dart';
import 'package:hufi_vnvc_application/models/chat_model.dart';
import 'package:hufi_vnvc_application/repositories/chat_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.initital()) {
    on<OnSendMessageEvent>((event, emit) async {
      emit(state.copyWith(status: ChatStatus.Sending));
      try {
        state.chats.insert(
            0,
            ChatModel(
                message: event.chat, isYou: true, timeSend: DateTime.now()));

        emit(state.copyWith(status: ChatStatus.SendSuccess));
        var response = await ChatRepository().sendChat(event.chat);
        print(response);
        state.chats.insert(
            0,
            ChatModel(
                message: response, isYou: false, timeSend: DateTime.now()));
        emit(state.copyWith(status: ChatStatus.Recived));
        print("vào dưới");
      } catch (e) {
        print(e.toString());
        emit(state.copyWith(status: ChatStatus.SendFailed));
      }
    });
  }
}
