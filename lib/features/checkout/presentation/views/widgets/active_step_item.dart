import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.check,
            color: context.palette.onPrimary,
            size: 18,
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppStyles.bold13.copyWith(color: context.palette.accent),
        ),
      ],
    );
  }
}
