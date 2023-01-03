import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/history_injection_model.dart';
import 'package:hufi_vnvc_application/utils/FormWithSearchWidget/form_with_search.dart';
import 'package:hufi_vnvc_application/widgets/history_injection_widget.dart';

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
