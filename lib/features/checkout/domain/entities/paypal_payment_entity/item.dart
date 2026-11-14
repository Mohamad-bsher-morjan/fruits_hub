import 'package:fruits_hub/core/helper_functions/get_currency.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  factory ItemEntity.fromCartItemEntity(CartItemEntity cartItemEntity) => ItemEntity(
    name: cartItemEntity.productEntity.name,
    quantity: cartItemEntity.quantity,
    price: cartItemEntity.productEntity.price.toString(),
    currency: getCurrency(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
