import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/record_bloc/history_injection_bloc/history_injection_event.dart';
import 'package:hufi_vnvc_application/blocs/record_bloc/history_injection_bloc/history_injection_state.dart';
import 'package:hufi_vnvc_application/repositories/history_injection_repository.dart';

class HistoryInjectionBloc
    extends Bloc<HistoryInjectionEvent, HistoryInjectionState> {
  HistoryInjectionBloc() : super(HistoryInjectionState()) {
    on<OnLoadingHistoryInjectionState>((event, emit) async {
      emit(HistoryInjectionLoadingState());
      try {
        var historyInjections =
            await HistoryInjectionRepostitory().getHistoryInjections();
        emit(
            HistoryInjectionSuccessState(historyInjections: historyInjections));
      } catch (e) {
        emit(HistoryInjectionFailedState(error: e.toString()));
      }
    });
  }
}
