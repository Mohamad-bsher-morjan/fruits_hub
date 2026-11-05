import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageContoller,
  });

  final PageController pageContoller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller:pageContoller,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getSteps().length,
      itemBuilder: (context, index) {
        return SizedBox();
      },
    );
  }
}
