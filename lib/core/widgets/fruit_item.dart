import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xfff3f5f7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
                if (productEntity.imageUrl != null &&
                    productEntity.imageUrl!.isNotEmpty)
                  Flexible(
                    child: Image.network(
                      productEntity.imageUrl!,
                      errorBuilder: (context, error, stackTrace) =>
                          const _FruitImagePlaceholder(),
                    ),
                  )
                else
                  const _FruitImagePlaceholder(),
                SizedBox(height: 24),
                ListTile(
                  title: Text(
                    productEntity.name,
                    style: AppStyles.semiBold16,
                    textAlign: .right,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.price} ليرة',
                          style: AppStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: AppStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: AppStyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon((Icons.add), color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FruitImagePlaceholder extends StatelessWidget {
  const _FruitImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.image_not_supported_outlined,
      size: 80,
      color: AppColors.lightSecondaryColor,
    );
  }
}
