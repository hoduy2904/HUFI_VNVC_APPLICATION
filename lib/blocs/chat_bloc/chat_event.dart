import 'package:equatable/equatable.dart';

class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnSendMessageEvent extends ChatEvent {
  final String chat;
  OnSendMessageEvent({required this.chat});
  @override
  List<Object?> get props => [chat];
}
