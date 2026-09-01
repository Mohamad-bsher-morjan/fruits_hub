import 'package:flutter/material.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Best Selling Fruits',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}