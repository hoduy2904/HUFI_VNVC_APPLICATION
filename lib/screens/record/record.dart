import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/injection_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:hufi_vnvc_application/widgets/items/injection_item.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.primary,
        title: Text(
          "Hồ sơ tiêm chủng",
          style: TypographyTheme.titleBar,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          //Sidebar
          Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(children: [
                          CircleAvatar(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: Image.network(
                                fit: BoxFit.fill,
                                "https://upload.wikimedia.org/wikipedia/commons/f/fe/Son_Tung_M-TP_1_%282017%29.png"),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Nguyễn Thanh Tùng")
                        ]),
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
              child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      const TabBar(
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              text: "Lịch sử tiêm chủng",
                            ),
                            Tab(
                              text: "Mũi tiêm kế tiếp",
                            ),
                          ]),
                      Expanded(
                        child: TabBarView(children: <Widget>[
                          SingleChildScrollView(
                              child: Column(
                            children: listHistory
                                .map((e) => InjectionItem(model: e))
                                .toList(),
                          )),
                          Text("View Two")
                        ]),
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}

var listHistory = [
  InjectionModel(
      DateTime.now(), 2, "Cầu giấy", "Vắc xin 3 trong 1", "Chống chỉ định"),
  InjectionModel(
      DateTime.now(), 3, "Cầu giấy", "Vắc xin 3 trong 1", "Chống chỉ định"),
  InjectionModel(
      DateTime.now(), 1, "Cầu giấy", "Vắc xin 3 trong 1", "Chống chỉ định"),
];
