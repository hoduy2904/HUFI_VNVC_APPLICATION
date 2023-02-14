import 'package:equatable/equatable.dart';

class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnSendMessageEvent extends ChatEvent {
  final String chat;
  final String chatAPI;
  OnSendMessageEvent({required this.chat, this.chatAPI = ""});
  @override
  List<Object?> get props => [chat];
}
