import 'package:flutter/material.dart';
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
          backgroundColor: Color(0xfff2f3f3),
          child: Text(index, style: AppStyles.semiBold13),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppStyles.semiBold13.copyWith(color: Color(0xffaaaaaa)),
        ),
      ],
    );
  }
}
