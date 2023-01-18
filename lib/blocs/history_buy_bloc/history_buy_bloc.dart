import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_event.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_state.dart';

class HistoryBuyBloc extends Bloc<HistoryBuyEvent, HistoryBuyState> {
  HistoryBuyBloc() : super(HistoryBuyState()) {
    on<OnLoadHistoryBuyEvent>((event, emit) async {
      emit(HistoryBuyLoadingState());
      try {} catch (e) {
        emit(HistoryBuyFailedState(error: e.toString()));
      }
    });
  }
}
