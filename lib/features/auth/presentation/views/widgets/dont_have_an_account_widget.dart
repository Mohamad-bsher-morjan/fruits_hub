
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تملك حساب؟',
            style: AppStyles.semiBold16.copyWith(
              color: Color(0xff949d9e),
            ),
          ),
          TextSpan(
            text: ' ',
            style: AppStyles.semiBold16.copyWith(
              color: Color(0xff949d9e),
            ),
          ),
          TextSpan(
            text: 'قم بانشاء حساب',
            style: AppStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
