import 'package:equatable/equatable.dart';

class CartEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadCartEvent extends CartEvent {}

class OnAddCartEvent extends CartEvent {
  final int idProduct;
  OnAddCartEvent({required this.idProduct});
  @override
  // TODO: implement props
  List<Object?> get props => [idProduct];
}

class OnRemoveCartItem extends CartEvent {
  final int idProduct;
  OnRemoveCartItem({required this.idProduct});
  @override
  // TODO: implement props
  List<Object?> get props => [idProduct];
}
