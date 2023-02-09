import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_details/history_buy_event.dart';
import 'package:hufi_vnvc_application/blocs/history_buy_bloc/history_buy_details/history_buy_state.dart';
import 'package:hufi_vnvc_application/repositories/injection_schedule_details_repository.dart';

class HistoryBuyDetailsBloc
    extends Bloc<HistoryBuyDetailsEvent, HistoryBuyDetailsState> {
  HistoryBuyDetailsBloc() : super(HistoryBuyDetailsState()) {
    on<OnLoadHistoryBuyDetailsEvent>((event, emit) async {
      emit(HistoryBuyDetailsLoadingState());
      try {
        var injectionSDetails = await InjectionScheduleDetailsRepository()
            .getInjectionScheduleByFid(event.injectionScheduleId);
        emit(HistoryBuyDetailsSuccessState(histories: injectionSDetails));
      } catch (e) {
        emit(HistoryBuyDetailsFailedState(error: e.toString()));
      }
    });
  }
}
