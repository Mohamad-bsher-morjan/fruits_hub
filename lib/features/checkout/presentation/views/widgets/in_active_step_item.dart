import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final String index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: context.palette.card,
          child: Text(index, style: AppStyles.semiBold13),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppStyles.semiBold13.copyWith(color: context.palette.hint),
        ),
      ],
    );
  }
}
