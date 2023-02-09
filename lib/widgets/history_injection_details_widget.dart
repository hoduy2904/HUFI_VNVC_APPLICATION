import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_details/history_buy_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_details/history_buy_state.dart';
import 'package:hufi_vnvc_application/models/injection_schedule_details.dart';
import 'package:hufi_vnvc_application/widgets/items/history_buy_details_item.dart';

class HistoryInjectionDetailsWidget extends StatelessWidget {
  final List<InjectionScheduleDetails> items;
  const HistoryInjectionDetailsWidget({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBuyDetailsBloc, HistoryBuyDetailsState>(
      builder: ((context, state) => ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
          itemCount: items.length,
          itemBuilder: ((context, index) {
            return HistoryInjectionDetailsItem(items[index]);
          }))),
    );
  }
}
