import 'package:fruits_hub/core/helper_functions/get_currency.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

factory Amount.fromEntity(OrderEntity orderEntity) {
    return Amount(
      total: orderEntity.cartEntity.calculateTotalPrice().toString(),
      currency:getCurrency(),
      details: DetailsEntity.fromOrderEntity(orderEntity),
    );
  }

  
}
