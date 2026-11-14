import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final double price;
  final int quantity;
  final String imageUrl;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  factory OrderProductModel.fromEntity({
    required CartItemEntity cartItemEntity,
  }) {
    return OrderProductModel(
      name: cartItemEntity.productEntity.name,
      code: cartItemEntity.productEntity.code,
      price: cartItemEntity.productEntity.price.toDouble(),
      quantity: cartItemEntity.quantity,
      imageUrl: cartItemEntity.productEntity.imageUrl!,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
