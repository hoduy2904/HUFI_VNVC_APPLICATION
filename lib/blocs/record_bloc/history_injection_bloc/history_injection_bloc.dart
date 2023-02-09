import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/record_bloc/history_injection_bloc/history_injection_event.dart';
import 'package:hufi_vnvc_application/blocs/record_bloc/history_injection_bloc/history_injection_state.dart';
import 'package:hufi_vnvc_application/repositories/injection_schedule_details_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryInjectionBloc
    extends Bloc<HistoryInjectionEvent, HistoryInjectionState> {
  HistoryInjectionBloc() : super(HistoryInjectionState()) {
    on<OnLoadHistoryInjectionEvent>((event, emit) async {
      var prefs = await SharedPreferences.getInstance();
      int customerId = prefs.getInt("customerId")!;
      emit(HistoryInjectionLoadingState());
      try {
        var historyInjections = await InjectionScheduleDetailsRepository()
            .getHistoryInjection(customerId);
        emit(
            HistoryInjectionSuccessState(historyInjections: historyInjections));
      } catch (e) {
        emit(HistoryInjectionFailedState(error: e.toString()));
      }
    });

    on<OnLoadNextInjectionEvent>((event, emit) async {
      var prefs = await SharedPreferences.getInstance();
      int customerId = prefs.getInt("customerId")!;
      emit(NextInjectionLoadingState());
      try {
        var historyInjections = await InjectionScheduleDetailsRepository()
            .getNextInjection(customerId);
        emit(NextInjectionSuccessState(historyInjections: historyInjections));
      } catch (e) {
        emit(NextInjectionFailedState(error: e.toString()));
      }
    });
  }
}
