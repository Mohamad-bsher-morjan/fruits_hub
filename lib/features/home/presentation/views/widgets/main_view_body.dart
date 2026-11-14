import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/products_view.dart';
import 'package:fruits_hub/features/home/presentation/views/profile_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  static const Duration _duration = Duration(milliseconds: 350);
  static const Curve _curve = Curves.easeOutCubic;

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentViewIndex);
  }

  @override
  void didUpdateWidget(covariant MainViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentViewIndex != widget.currentViewIndex &&
        _pageController.hasClients) {
      _pageController.animateToPage(
        widget.currentViewIndex,
        duration: _duration,
        curve: _curve,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _KeepAlivePage(child: HomeView()),
        _KeepAlivePage(child: ProductsView()),
        _KeepAlivePage(child: CartView()),
        _KeepAlivePage(child: ProfileView()),
      ],
    );
  }
}

class _KeepAlivePage extends StatefulWidget {
  const _KeepAlivePage({required this.child});

  final Widget child;

  @override
  State<_KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<_KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
