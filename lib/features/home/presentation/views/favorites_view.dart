import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/fruit_item.dart';
import 'package:fruits_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مفضلاتي')),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final favoriteProducts = context
              .read<FavoriteCubit>()
              .favoriteProducts;

          if (favoriteProducts.isEmpty) {
            return Center(
              child: Text(
                'لا توجد منتجات في المفضلة',
                style: AppStyles.semiBold16.copyWith(
                  color: context.palette.mutedIcon,
                ),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favoriteProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 163 / 231,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) =>
                FruitItem(productEntity: favoriteProducts[index]),
          );
        },
      ),
    );
  }
}
