import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/chat_model.dart';

class ChatEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnSendMessageEvent extends ChatEvent {
  final String chat;
  OnSendMessageEvent({required this.chat});
  @override
  // TODO: implement props
  List<Object?> get props => [chat];
}
