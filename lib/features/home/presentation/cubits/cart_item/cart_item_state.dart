part of 'cart_item_cubit.dart';

abstract class CartItemState  {
  const CartItemState();


}

final class CartItemInitial extends CartItemState {}

final class CartItemUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;

  const CartItemUpdated({required this.cartItemEntity});
}
