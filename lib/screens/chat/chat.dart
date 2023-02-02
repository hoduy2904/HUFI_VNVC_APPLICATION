import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:hufi_vnvc_application/blocs/chat_bloc/chat_bloc.dart';
import 'package:hufi_vnvc_application/blocs/chat_bloc/chat_event.dart';
import 'package:hufi_vnvc_application/blocs/chat_bloc/chat_state.dart';
import 'package:hufi_vnvc_application/models/chat_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController message = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.primary,
          title: Text(
            "Trò chuyện",
            style: TypographyTheme.titleBar,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(),
          height: 50,
          child: TextField(
            minLines: 1,
            maxLines: null,
            controller: message,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
                hintText: "Vui lòng nhập nội dung",
                hintStyle: const TextStyle(fontSize: 12),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                suffixIcon: IconButton(
                    hoverColor: Colors.transparent,
                    onPressed: () => {
                          context
                              .read<ChatBloc>()
                              .add(OnSendMessageEvent(chat: message.text)),
                          message.text = "",
                        },
                    icon: Icon(
                      Icons.send,
                      color: ColorTheme.primary,
                    ))),
          ),
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: ((context, state) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: state.chats.length,
                  itemBuilder: ((context, index) {
                    return Row(
                      crossAxisAlignment: state.chats[index].isYou
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        if (!state.chats[index].isYou)
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/316126447_1841700076168720_2777481558525569042_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=8ygkSKiOurYAX8QiXzA&tn=Nqzr_mYTj8ovTKiJ&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfCANe_6sHdri1DDKcrHPjxra3636TjkAI9GvUJQOzdcKg&oe=63C43CF3"),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: !state.chats[index].isYou
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                                children: [
                              Wrap(children: [
                                Text(
                                  "${state.chats[index].isYou ? "Bạn" : "BOT GPT"}, ${DateFormat("dd/MM/yyyy hh:mm").format(state.chats[index].timeSend)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.grey.shade700),
                                )
                              ]),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: 5,
                                    left: state.chats[index].isYou ? 100 : 0,
                                    right: !state.chats[index].isYou ? 100 : 0),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: state.chats[index].isYou
                                        ? ColorTheme.secondary
                                        : Colors.blueGrey.shade700,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            !state.chats[index].isYou ? 3 : 20),
                                        topRight: Radius.circular(
                                            state.chats[index].isYou ? 3 : 20),
                                        bottomLeft: const Radius.circular(20),
                                        bottomRight:
                                            const Radius.circular(20))),
                                child: Text(
                                  state.chats[index].message.trim(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ]))
                      ],
                    );
                  })))),
        ));
  }
}
