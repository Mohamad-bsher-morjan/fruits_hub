part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

final class CartItemInitial extends CartState {}

final class CartItemAdded extends CartState {}

final class CartItemRemoved extends CartState {}



