import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_event.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_state.dart';
import 'package:hufi_vnvc_application/repositories/injection_schedule_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryBuyBloc extends Bloc<HistoryBuyEvent, HistoryBuyState> {
  HistoryBuyBloc() : super(HistoryBuyState()) {
    on<OnLoadHistoryBuyEvent>((event, emit) async {
      emit(HistoryBuyLoadingState());
      try {
        var prefs = await SharedPreferences.getInstance();

        var historyBuy = await InjectionScheduleRepository()
            .getHistoryInjection(prefs.getInt("customerId")!);
        emit(HistoryBuySuccessState(histories: historyBuy));
      } catch (e) {
        emit(HistoryBuyFailedState(error: e.toString()));
      }
    });
  }
}
