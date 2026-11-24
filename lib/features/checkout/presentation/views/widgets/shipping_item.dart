import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });
  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: context.palette.card.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? context.palette.accent : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingItemDot()
                  : const InActiveShippingItemDot(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.semiBold13),
                  const SizedBox(height: 6),
                  Text(
                    subTitle,
                    textAlign: TextAlign.right,
                    style: AppStyles.regular13.copyWith(
                      color: context.palette.hint,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  '$price جنيه',
                  style: AppStyles.bold13.copyWith(
                    color: context.palette.accent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 1, color: context.palette.mutedIcon),
        ),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: OvalBorder(
          side: BorderSide(width: 4, color: context.palette.surface),
        ),
      ),
    );
  }
}
