import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_sell_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 16),
                CustomHomeAppBar(),
                const SizedBox(height: 16),
                SearchTextField(),
                const SizedBox(height: 12),
                FeaturedList(),
                const SizedBox(height: 12),
                BestSellHeader()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
