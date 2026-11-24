import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تملك حساب بالفعل؟',
            style: AppStyles.semiBold16.copyWith(color: context.palette.hint),
          ),
          TextSpan(
            text: ' ',
            style: AppStyles.semiBold16.copyWith(color: context.palette.hint),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: 'تسجيل دخول',
            style: AppStyles.semiBold16.copyWith(color: context.palette.accent),
          ),
        ],
      ),
    );
  }
}
