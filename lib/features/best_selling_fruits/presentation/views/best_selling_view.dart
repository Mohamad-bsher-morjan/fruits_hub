import 'package:flutter/material.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = '/best-selling-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأكثر مبيعا')),
      body: BestSellingViewBody(),
    );
  }
}
