import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/cart_model.dart';

class CartState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final List<CartModel> carts;
  CartSuccessState({this.carts = const []});
  @override
  // TODO: implement props
  List<Object?> get props => [carts];
}

class CartFailedState extends CartState {
  final String error;
  CartFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
