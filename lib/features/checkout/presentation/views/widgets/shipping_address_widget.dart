import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment__item.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesLocation),
          const SizedBox(width: 8),
          Text(
            'المريديان بناية ستوت ط 2',
            textAlign: TextAlign.right,
            style: AppStyles.regular13.copyWith(color: const Color(0xFF4E5556)),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // pageController.animateToPage(
              //   1,
              //   duration: const Duration(milliseconds: 300),
              //   curve: Curves.easeIn,
              // );
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(Assets.imagesEdit),
                  const SizedBox(width: 4),
                  Text(
                    'تعديل',
                    style: AppStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
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
