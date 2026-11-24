import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$productsLength نتائج',
          textAlign: TextAlign.right,
          style: AppStyles.bold16,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: context.palette.surface.withValues(alpha: 0.1),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: context.palette.border),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(
            Assets.imagesFilter2,
            colorFilter: ColorFilter.mode(
              context.palette.mutedIcon,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
