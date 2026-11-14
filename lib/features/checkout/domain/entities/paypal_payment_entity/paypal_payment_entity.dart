import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderEntity orderEntity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(orderEntity),
      description: 'Payment description',
      itemList: ItemList.fromCartItemEntities(orderEntity.cartEntity.cartItems),
    );
  }

}
