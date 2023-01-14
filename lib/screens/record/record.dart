import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/record_bloc/history_injection_bloc/history_injection_bloc.dart';
import 'package:hufi_vnvc_application/blocs/record_bloc/history_injection_bloc/history_injection_state.dart';
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
                      child: Column(children: [
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
                              child: BlocProvider(
                                  create: (context) => HistoryInjectionBloc(),
                                  child: BlocBuilder<HistoryInjectionBloc,
                                          HistoryInjectionState>(
                                      builder: ((context, state) {
                                    if (state is HistoryInjectionLoadingState) {
                                      return const Center(child: Text(""));
                                    }
                                    if (state is HistoryInjectionSuccessState) {
                                      return Column(
                                          children: state.historyInjections
                                              .map((e) =>
                                                  InjectionItem(model: e))
                                              .toList());
                                    } else {
                                      return const SizedBox();
                                    }
                                  })))),
                          const Text("View Two")
                        ]))
                      ]))),
            ])));
  }
}
