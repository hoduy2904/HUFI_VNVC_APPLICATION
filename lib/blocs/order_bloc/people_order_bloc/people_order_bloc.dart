import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/people_order_bloc/people_order_event.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/people_order_bloc/people_order_state.dart';

class PeopleOrderBloc extends Bloc<PeopleOrderEvent, PeopleOrderState> {
  PeopleOrderBloc() : super(PeopleOrderState()) {
    on<OnLoadPeopleOrderEvent>((event, emit) {
      emit(PeopleOrderLoadingState());
      try {} catch (e) {
        emit(PeopleOrderFailedState(error: e.toString()));
      }
    });
    on<OnSearchPeopleOrderEvent>((event, emit) {
      emit(PeopleOrderLoadingState());
      try {} catch (e) {
        emit(PeopleOrderFailedState(error: e.toString()));
      }
    });
  }
}
