import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_event.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_state.dart';
import 'package:hufi_vnvc_application/repositories/injection_schedule_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryBuyBloc extends Bloc<HistoryBuyEvent, HistoryBuyState> {
  HistoryBuyBloc() : super(const HistoryBuyState()) {
    on<OnLoadHistoryBuyEvent>((event, emit) async {
      emit(state.copyWith(status: HistoryBuyStatus.Loading));
      try {
        var prefs = await SharedPreferences.getInstance();

        var historyBuy = await InjectionScheduleRepository()
            .getHistoryInjection(
                customerId: prefs.getInt("customerId")!, page: 1, pageSize: 5);
        emit(state.copyWith(
            status: HistoryBuyStatus.Success,
            historyBuySuccessState:
                HistoryBuySuccessState(histories: historyBuy)));
      } catch (e) {
        emit(state.copyWith(
            status: HistoryBuyStatus.Failed, message: e.toString()));
      }
    });
    on<OnFetchHistoryBuyEvent>((event, emit) async {
      try {
        var prefs = await SharedPreferences.getInstance();

        if (!state.isEndPage) {
          var historyBuy = await InjectionScheduleRepository()
              .getHistoryInjection(
                  customerId: prefs.getInt("customerId")!,
                  page: state.currentPage + 1,
                  pageSize: 5);
          if (historyBuy.length < 5) emit(state.copyWith(isEndPage: true));

          emit(state.copyWith(
              status: HistoryBuyStatus.Success,
              currentPage: state.currentPage + 1));
          state.historyBuySuccessState!.histories.addAll(historyBuy);
        }
      } catch (e) {
        emit(state.copyWith(
            status: HistoryBuyStatus.Failed, message: e.toString()));
      }
    });
  }
}
