import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: context.palette.softSurface),
      child: Center(
        child: Text(
          'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length}  منتجات في سله التسوق',
          style: TextStyle(
            color: context.palette.accent,
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        ),
      ),
    );
  }
}
