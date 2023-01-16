import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/payment_order_bloc/payment_order_event.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/payment_order_bloc/payment_order_state.dart';

class PaymentOrderBloc extends Bloc<PaymentOrderEvent, PaymentOrderState> {
  PaymentOrderBloc() : super(PaymentOrderState()) {
    on<OnPayClickEvent>((event, emit) {
      emit(PaymentOrderLoadingState());
      try {} catch (e) {
        emit(PaymentOrderResultState(false, e.toString()));
      }
    });
  }
}
