import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/products_view.dart';
import 'package:fruits_hub/features/home/presentation/views/profile_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view.dart';

// أضف imports الصفحات الثلاث الأخرى حسب مساراتها عندك.

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  late final List<Widget> views = [
    const HomeView(),
    const ProductsView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentViewIndex,
          children: views,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentViewIndex,
        onPressed: (index) {
          setState(() {
            currentViewIndex = index;
          });
        },
      ),
    );
  }
}