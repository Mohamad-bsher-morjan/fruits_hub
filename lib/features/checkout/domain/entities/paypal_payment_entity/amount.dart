import 'package:fruits_hub/core/helper_functions/get_currency.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_input_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

factory Amount.fromEntity(OrderInputEntity orderEntity) {
    return Amount(
      total: orderEntity.cartEntity.calculateTotalPrice().toString(),
      currency:getCurrency(),
      details: DetailsEntity.fromOrderEntity(orderEntity),
    );
  }
Map<String, dynamic> toMap(){
    return{
      'total': total,
      'currency': currency,
      'details': details?.toMap(),
    };
  }
  
}
