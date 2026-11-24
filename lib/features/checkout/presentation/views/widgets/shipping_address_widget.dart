import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_input_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment__item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesLocation,
            colorFilter: ColorFilter.mode(
              context.palette.accent,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${context.read<OrderInputEntity>().shippingAddressEntity}',
            textAlign: TextAlign.right,
            style: AppStyles.regular13.copyWith(color: context.palette.subtitle),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesEdit,
                    colorFilter: ColorFilter.mode(
                      context.palette.mutedIcon,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'تعديل',
                    style: AppStyles.semiBold13.copyWith(
                      color: context.palette.hint,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
