import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/history_injection_model.dart';
import 'package:hufi_vnvc_application/widgets/items/history_injection_item.dart';

class HistoryInjectionWidget extends StatelessWidget {
  final List<HistoryInjectionModel> items;
  const HistoryInjectionWidget({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: items.length,
          itemBuilder: ((context, index) {
            return HistoryInjectionItem(items[index]);
          })),
    );
  }
}
