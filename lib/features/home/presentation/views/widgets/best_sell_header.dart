import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/best_selling_view.dart';

class BestSellHeader extends StatelessWidget {
  const BestSellHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        children: [
          Text('الأكثر مبيعا', style: AppStyles.bold16),
          Spacer(),
          Text(
            'المزيد',
            style: AppStyles.bold13.copyWith(color: Color(0xff949d9e)),
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
