import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/core/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'البريد الالكتروني',
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffc9cecf)),
            hintText: 'كلمة المرور',
            textInputType: TextInputType.visiblePassword,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: .end,
            children: [
              Text(
                'نسيت كلمة المرور؟',
                style: AppStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 33),
          CustomButton(
            backgroundColor: AppColors.primaryColor,
            title: 'تسجيل دخول',
            onPressed: () {},
          ),

          SizedBox(height: 33),
          DontHaveAnAccountWidget(),
          OrDivider()
        ],
      ),
    );
  }
}
