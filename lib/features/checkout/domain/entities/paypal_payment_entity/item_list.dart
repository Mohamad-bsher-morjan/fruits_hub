import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  factory ItemList.fromCartItemEntities(
    List<CartItemEntity> cartItemEntities,
  ) => ItemList(
    items: cartItemEntities
        .map((cartItemEntity) => ItemEntity.fromCartItemEntity(cartItemEntity))
        .toList(),
  );
  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
