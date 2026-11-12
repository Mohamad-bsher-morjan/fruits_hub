import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = 'checkout';

  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'الشحن', showNotification: false),
      body: Provider<OrderEntity>(
        create: (context) => OrderEntity(
          cartEntity: cartEntity,
          shippingAddressEntity: ShippingAddressEntity(), uID: getUser().uId,
        ),
        child: CheckoutViewBody(),
      ),
    );
  }
}
