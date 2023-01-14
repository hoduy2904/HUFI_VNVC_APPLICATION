import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/record_bloc/schedule_injection_bloc/schedule_injection_event.dart';
import 'package:hufi_vnvc_application/blocs/record_bloc/schedule_injection_bloc/schedule_injection_state.dart';
import 'package:hufi_vnvc_application/repositories/schedule_injection_repository.dart';

class ScheduleInjectionBloc
    extends Bloc<ScheduleInjectionEvent, ScheduleInjectionState> {
  ScheduleInjectionBloc() : super(ScheduleInjectionState()) {
    on<OnLoadScheduleInjectionEvent>((event, emit) async {
      emit(ScheduleInjectionLoadingState());
      try {
        var scheduleInjections =
            await ScheduleInjectionRepostitory().getScheduleInjections();
        emit(ScheduleInjectionSuccessState(
            scheduleInjections: scheduleInjections));
      } catch (e) {
        emit(ScheduleInjectionFailedState(error: e.toString()));
      }
    });
  }
}
