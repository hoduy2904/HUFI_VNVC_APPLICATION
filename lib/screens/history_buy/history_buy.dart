import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_state.dart';
import 'package:hufi_vnvc_application/models/history_buy_model.dart';
import 'package:hufi_vnvc_application/utils/FormWithSearchWidget/form_with_search.dart';
import 'package:hufi_vnvc_application/widgets/history_injection_widget.dart';

class HistoryBuyScreen extends StatefulWidget {
  final bool isShowAppBar;
  const HistoryBuyScreen({this.isShowAppBar = true, super.key});

  @override
  State<HistoryBuyScreen> createState() => _HistoryBuyScreenState();
}

class _HistoryBuyScreenState extends State<HistoryBuyScreen> {
  String searchValue = "";
  @override
  Widget build(BuildContext context) {
    return FormWithSearchWidget(
        isShowAppBar: widget.isShowAppBar,
        titleBar: "Lịch sử mua",
        searchChange: (value) => {
              setState((() {
                searchValue = value;
              }))
            },
        child: BlocProvider(
            create: (context) => HistoryBuyBloc(),
            child: BlocBuilder<HistoryBuyBloc, HistoryBuyState>(
                builder: ((context, state) =>
                    HistoryInjectionWidget(items: items)))));
  }
}

var items = [
  HistoryBuyModel(DateTime.now(), true, "#25HSEH3", "Vắc-xin AstraZeneca",
      DateTime.now(), 500000),
  HistoryBuyModel(DateTime.now(), false, "#25HSEH3", "Vắc-xin AstraZeneca",
      DateTime.now(), 500000),
  HistoryBuyModel(DateTime.now(), true, "#25HSEH3", "Vắc-xin AstraZeneca",
      DateTime.now(), 500000),
  HistoryBuyModel(DateTime.now(), true, "#25HSEH3", "Vắc-xin AstraZeneca",
      DateTime.now(), 500000)
];
