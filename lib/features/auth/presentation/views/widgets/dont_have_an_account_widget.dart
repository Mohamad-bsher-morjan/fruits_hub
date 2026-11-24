import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تملك حساب؟',
            style: AppStyles.semiBold16.copyWith(color: context.palette.hint),
          ),
          TextSpan(
            text: ' ',
            style: AppStyles.semiBold16.copyWith(color: context.palette.hint),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
            text: 'قم بانشاء حساب',
            style: AppStyles.semiBold16.copyWith(color: context.palette.accent),
          ),
        ],
      ),
    );
  }
}
