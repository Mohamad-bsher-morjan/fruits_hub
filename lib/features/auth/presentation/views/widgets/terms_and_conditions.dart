import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال انشاء الحساب فانك توافق على ',
                  style: AppStyles.semiBold13.copyWith(
                    color: Color(0xff949d9e),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                TextSpan(text: ' ', style: AppStyles.semiBold13.copyWith()),
                TextSpan(
                  text: 'الخاصة',
                  style: AppStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                TextSpan(text: ' ', style: AppStyles.semiBold13.copyWith()),
                TextSpan(
                  text: 'بنا',
                  style: AppStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
