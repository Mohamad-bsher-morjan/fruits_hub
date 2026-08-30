import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class BestSellHeader extends StatelessWidget {
  const BestSellHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('الأكثر مبيعا', style: AppStyles.bold16),
        Spacer(),
        Text(
          'المزيد',
          style: AppStyles.bold13.copyWith(color: Color(0xff949d9e)),
          textAlign: .center,
        ),
      ],
    );
  }
}
