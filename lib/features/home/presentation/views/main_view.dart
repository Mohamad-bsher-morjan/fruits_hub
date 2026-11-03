import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/products_view.dart';
import 'package:fruits_hub/features/home/presentation/views/profile_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: currentViewIndex,
            children: const [
              HomeView(),
              ProductsView(),
              CartView(),
              ProfileView(),
            ],
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
      ),
    );
  }
}
