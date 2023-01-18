import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_event.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_state.dart';
import 'package:hufi_vnvc_application/models/history_buy_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
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
            create: (context) => HistoryBuyBloc()
              ..add(OnLoadHistoryBuyEvent(search: searchValue)),
            child: BlocBuilder<HistoryBuyBloc, HistoryBuyState>(
                builder: ((context, state) {
              if (state is HistoryBuyLoadingState) {
                return Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: ColorTheme.primary, size: 24),
                );
              } else if (state is HistoryBuySuccessState) {
                return HistoryInjectionWidget(items: state.histories);
              } else {
                return Center(
                  child: Text((state as HistoryBuyFailedState).error),
                );
              }
            }))));
  }
}
