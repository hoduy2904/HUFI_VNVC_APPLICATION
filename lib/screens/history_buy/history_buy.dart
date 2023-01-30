import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_event.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_state.dart';
import 'package:hufi_vnvc_application/models/history_buy_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/utils/Debouncer/debouncer.dart';
import 'package:hufi_vnvc_application/utils/FormWithSearchWidget/form_with_search.dart';
import 'package:hufi_vnvc_application/widgets/history_injection_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HistoryBuyScreen extends StatefulWidget {
  final bool isShowAppBar;
  const HistoryBuyScreen({this.isShowAppBar = true, super.key});

  @override
  State<HistoryBuyScreen> createState() => _HistoryBuyScreenState();
}

class _HistoryBuyScreenState extends State<HistoryBuyScreen> {
  var debounce = Debouncer(milliseconds: 1000);
  String searchValue = "";
  @override
  Widget build(BuildContext context) {
    return FormWithSearchWidget(
        isShowAppBar: widget.isShowAppBar,
        titleBar: "Lịch sử mua",
        hint: "Tìm theo mã, ngày",
        searchChange: () {},
        child: BlocProvider(
            create: (context) => HistoryBuyBloc()
              ..add(OnLoadHistoryBuyEvent(search: searchValue)),
            child: BlocBuilder<HistoryBuyBloc, HistoryBuyState>(
                builder: ((context, state) {
              if (state.status == HistoryBuyStatus.Loading) {
                return Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: ColorTheme.primary, size: 24),
                );
              } else if (state.status == HistoryBuyStatus.Success) {
                if (state.historyBuySuccessState!.histories.isEmpty) {
                  return const Center(
                      child: Text("Không có lịch sử mua vaccine"));
                }
                return NotificationListener<ScrollEndNotification>(
                  onNotification: ((notification) {
                    if (notification.metrics.maxScrollExtent -
                            notification.metrics.pixels <
                        20) {
                      debounce.run(() => context
                          .read<HistoryBuyBloc>()
                          .add(OnFetchHistoryBuyEvent()));
                    }
                    return true;
                  }),
                  child: HistoryInjectionWidget(
                      items: state.historyBuySuccessState?.histories ?? []),
                );
              } else if (state.status == HistoryBuyStatus.Failed) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text("Vui lòng thử lại"),
                );
              }
            }))));
  }
}
