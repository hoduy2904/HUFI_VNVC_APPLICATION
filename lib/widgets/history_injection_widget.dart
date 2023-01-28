import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_state.dart';
import 'package:hufi_vnvc_application/models/history_buy_model.dart';
import 'package:hufi_vnvc_application/models/injection_schedule.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/widgets/items/history_buy_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HistoryInjectionWidget extends StatelessWidget {
  final List<InjectionScheduleModel> items;
  const HistoryInjectionWidget({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBuyBloc, HistoryBuyState>(
        builder: ((context, state) => Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: items.length,
                  itemBuilder: ((context, index) {
                    if (state.isEndPage) {
                      return HistoryInjectionItem(items[index]);
                    } else if (items.length - index == 1) {
                      return Column(
                        children: [
                          HistoryInjectionItem(items[index]),
                          LoadingAnimationWidget.fourRotatingDots(
                              color: ColorTheme.primary, size: 24)
                        ],
                      );
                    }
                    return HistoryInjectionItem(items[index]);
                  })),
            )));
  }
}
