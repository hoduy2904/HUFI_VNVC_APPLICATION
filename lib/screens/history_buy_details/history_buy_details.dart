import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_details/history_buy_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_details/history_buy_event.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_details/history_buy_state.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:hufi_vnvc_application/widgets/history_injection_details_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HistoryBuyDetailsScreen extends StatelessWidget {
  final int injectionScheduleId;
  const HistoryBuyDetailsScreen({required this.injectionScheduleId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.primary,
          title: Text(
            "Chi tiết hoá đơn #$injectionScheduleId",
            style: TypographyTheme.titleBar,
          ),
          centerTitle: true,
        ),
        body: BlocProvider(
            create: (context) => HistoryBuyDetailsBloc()
              ..add(OnLoadHistoryBuyDetailsEvent(
                  injectionScheduleId: injectionScheduleId)),
            child: BlocBuilder<HistoryBuyDetailsBloc, HistoryBuyDetailsState>(
                builder: ((context, state) {
              if (state is HistoryBuyDetailsLoadingState) {
                return Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: ColorTheme.primary, size: 24),
                );
              } else if (state is HistoryBuyDetailsSuccessState) {
                if (state.histories.isEmpty) {
                  return const Center(child: Text("Trống"));
                }
                return HistoryInjectionDetailsWidget(
                  items: state.histories,
                );
              } else if (state is HistoryBuyDetailsFailedState) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return const Center(
                  child: Text("Vui lòng thử lại"),
                );
              }
            }))));
  }
}
