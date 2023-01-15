import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_event.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_state.dart';
import 'package:hufi_vnvc_application/repositories/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<OnLoadCartEvent>((event, emit) async {
      emit(CartLoadingState());
      try {
        var carts = await CartRepository().getCarts();
        emit(CartSuccessState(carts: carts));
      } catch (e) {
        emit(CartFailedState(error: e.toString()));
      }
    });
  }
}
