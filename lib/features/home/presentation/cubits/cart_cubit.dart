import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartItemInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);

    var cartItem = cartEntity.getCartItem(productEntity);

    if (isProductExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }
}
