import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/payment_order_bloc/payment_order_event.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/payment_order_bloc/payment_order_state.dart';
import 'package:hufi_vnvc_application/models/injection_schedule.dart';
import 'package:hufi_vnvc_application/models/injection_schedule_details.dart';
import 'package:hufi_vnvc_application/models/user_model.dart';
import 'package:hufi_vnvc_application/repositories/injection_schedule_details_repository.dart';
import 'package:hufi_vnvc_application/repositories/injection_schedule_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentOrderBloc extends Bloc<PaymentOrderEvent, PaymentOrderState> {
  PaymentOrderBloc() : super(PaymentOrderState()) {
    on<OnPayClickEvent>((event, emit) async {
      emit(PaymentOrderLoadingState());
      try {
        var prefs = await SharedPreferences.getInstance();
        var userString = prefs.getString("user");
        var user = UserModel.fromJson(jsonDecode(userString!));
        var insertSchedule = await InjectionScheduleRepository()
            .insertInjectionSchedule(
                InjectionScheduleModel(
                    id: 0,
                    priorities: 0,
                    date: DateTime.now(),
                    created: DateTime.now(),
                    customerId: event.selectId,
                    note: "Đặt từ APP"),
                user.id);
        var insertDetails = await InjectionScheduleDetailsRepository()
            .insertInjectionScheduleDetails(
                InjectionScheduleDetails(
                    shipmentId: -1,
                    injections: 1,
                    amount: 1,
                    address: "",
                    injectionScheduleId: insertSchedule.id!),
                user.id);

        if (insertDetails.isSuccess) {
          emit(PaymentOrderResultState(true, "Đặt hàng thành công"));
        } else {
          emit(PaymentOrderResultState(false, "Đặt hàng thất bại"));
        }
      } catch (e) {
        print(e.toString());
        emit(PaymentOrderResultState(false, e.toString()));
      }
    });
  }
}
