import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/people_order_bloc/people_order_event.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/people_order_bloc/people_order_state.dart';
import 'package:hufi_vnvc_application/models/user_model.dart';
import 'package:hufi_vnvc_application/repositories/customer_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PeopleOrderBloc extends Bloc<PeopleOrderEvent, PeopleOrderState> {
  PeopleOrderBloc() : super(PeopleOrderState()) {
    on<OnLoadPeopleOrderEvent>((event, emit) async {
      emit(PeopleOrderLoadingState());
      try {
        var prefs = await SharedPreferences.getInstance();
        var userString = prefs.getString("user");
        var user = UserModel.fromJson(jsonDecode(userString!));
        var customer = await CustomerRepository().getCustomerModel(user.id);
        emit(PeopleOrderSuccessState(people: customer));
      } catch (e) {
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
