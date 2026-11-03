import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  buildAppBar(context, 'السلة', showNotification: false),
                  const SizedBox(height: 16),
                  CartHeader(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            SliverToBoxAdapter(child: CustomDivider()),
            CartItemsList(cartItem: [],),
            SliverToBoxAdapter(child: CustomDivider()),
          ],
        ),
        Positioned(
          right: 16,
          left: 16,
          bottom: MediaQuery.sizeOf(context).height * .05,
          child: CustomButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {},
            title: 'pay money',
          ),
        ),
      ],
    );
  }
}
