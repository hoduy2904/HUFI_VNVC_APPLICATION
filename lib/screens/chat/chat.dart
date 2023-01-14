import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hufi_vnvc_application/models/chat_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.primary,
        title: Text(
          "Trò chuyện",
          style: TypographyTheme.titleBar,
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: ((context, index) {
                        return Wrap(
                          alignment: list[index].isYou
                              ? WrapAlignment.end
                              : WrapAlignment.start,
                          children: [
                            if (!list[index].isYou)
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/316126447_1841700076168720_2777481558525569042_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=8ygkSKiOurYAX8QiXzA&tn=Nqzr_mYTj8ovTKiJ&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfCANe_6sHdri1DDKcrHPjxra3636TjkAI9GvUJQOzdcKg&oe=63C43CF3"),
                              ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                                crossAxisAlignment: !list[index].isYou
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "BOT, 00:24",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade700),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: 5,
                                        left: list[index].isYou ? 110 : 0,
                                        right: !list[index].isYou ? 110 : 0),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: list[index].isYou
                                            ? ColorTheme.secondary
                                            : Colors.blueGrey.shade700,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                !list[index].isYou ? 3 : 20),
                                            topRight: Radius.circular(
                                                list[index].isYou ? 3 : 20),
                                            bottomLeft:
                                                const Radius.circular(20),
                                            bottomRight:
                                                const Radius.circular(20))),
                                    child: Text(
                                      list[index].message,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ])
                          ],
                        );
                      }))),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(),
                height: 50,
                child: TextField(
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      hintText: "Vui lòng nhập nội dung",
                      hintStyle: const TextStyle(fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      suffixIcon: IconButton(
                          hoverColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            color: ColorTheme.primary,
                          ))),
                ),
              )
            ],
          )),
    );
  }
}

var list = [
  ChatModel(
      message:
          "Người gửisssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
      isYou: true,
      timeSend: DateTime.now()),
  ChatModel(message: "Người nhận", isYou: false, timeSend: DateTime.now()),
  ChatModel(message: "Người nhận 2", isYou: false, timeSend: DateTime.now()),
];
