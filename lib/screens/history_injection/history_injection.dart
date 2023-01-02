import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/history_injection_model.dart';
import 'package:flutter_application_1/utils/FormWithSearchWidget/form_with_search.dart';
import 'package:flutter_application_1/utils/SearchBarWidget/search_bar.dart';
import 'package:flutter_application_1/widgets/history_injection_widget.dart';

class HistoryInjectionScreen extends StatefulWidget {
  final bool isShowAppBar;
  const HistoryInjectionScreen({this.isShowAppBar = true, super.key});

  @override
  State<HistoryInjectionScreen> createState() => _HistoryInjectionScreenState();
}

class _HistoryInjectionScreenState extends State<HistoryInjectionScreen> {
  String searchValue = "";
  @override
  Widget build(BuildContext context) {
    return FormWithSearchWidget(
        isShowAppBar: widget.isShowAppBar,
        titleBar: "Lịch sử tiêm",
        searchChange: (value) => {
              setState((() {
                searchValue = value;
              }))
            },
        child: HistoryInjectionWidget(items: items));
  }
}

var items = [
  HistoryInjectionModel(DateTime.now(), true, "#25HSEH3", "Vắc-xin AstraZeneca",
      DateTime.now(), 500000),
  HistoryInjectionModel(DateTime.now(), false, "#25HSEH3",
      "Vắc-xin AstraZeneca", DateTime.now(), 500000),
  HistoryInjectionModel(DateTime.now(), true, "#25HSEH3", "Vắc-xin AstraZeneca",
      DateTime.now(), 500000),
  HistoryInjectionModel(DateTime.now(), true, "#25HSEH3", "Vắc-xin AstraZeneca",
      DateTime.now(), 500000)
];
