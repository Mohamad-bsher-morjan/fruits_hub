import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        child: FittedBox(
          child: Text(
            'تسوق الآن',
            style: AppStyles.bold13.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
