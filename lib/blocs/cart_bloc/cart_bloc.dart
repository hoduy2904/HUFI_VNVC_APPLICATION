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
    on<OnAddCartEvent>((event, emit) async {
      emit(AddToCartLoading());
      try {
        var addCartResult =
            await CartRepository().insertCart(vaccineId: event.idProduct);
        emit(AddToCartResult(
            message: addCartResult.messages.first,
            isSuccess: addCartResult.isSuccess));
      } catch (e) {
        emit(AddToCartResult(message: e.toString(), isSuccess: false));
      }
    });

    on<OnRemoveCartItem>((event, emit) async {
      try {
        print("have 1");
        var removeCartResult =
            await CartRepository().removeCart(event.idProduct);
        print("have 2");
        if (removeCartResult.isSuccess) {
          var carts = await CartRepository().getCarts();
          emit(CartSuccessState(carts: carts));
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
