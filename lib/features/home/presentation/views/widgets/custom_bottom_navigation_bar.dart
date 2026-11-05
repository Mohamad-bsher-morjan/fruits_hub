import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onPressed;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xffeeeeee),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(
            index: 0,
            activeIconPath: Assets.imagesVuesaxBoldHome,
            inactiveIconPath: Assets.imagesVuesaxOutlineHome,
            label: 'الرئيسية',
          ),
          _buildItem(
            index: 1,
            activeIconPath: Assets.imagesVuesaxBoldProducts,
            inactiveIconPath: Assets.imagesVuesaxOutlineProducts,
            label: 'المنتجات',
          ),
          _buildItem(
            index: 2,
            activeIconPath: Assets.imagesVuesaxBoldShoppingCart,
            inactiveIconPath: Assets.imagesVuesaxOutlineShoppingCart,
            label: 'سلة التسوق',
          ),
          _buildItem(
            index: 3,
            activeIconPath: Assets.imagesVuesaxBoldUser,
            inactiveIconPath: Assets.imagesVuesaxOutlineUser,
            label: 'حسابي',
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required int index,
    required String activeIconPath,
    required String inactiveIconPath,
    required String label,
  }) {
    final bool isSelected = currentIndex == index;
    const duration = Duration(milliseconds: 350);
    const curve = Curves.easeOutCubic;

    return GestureDetector(
      onTap: () => onPressed(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: duration,
        curve: curve,
        padding: EdgeInsets.only(
          left: isSelected ? 6 : 10,
          right: isSelected ? 4 : 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xfff1f4f2) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xff087443).withValues(alpha: 0.18),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ]
              : const [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            AnimatedContainer(
              duration: duration,
              curve: curve,
              width: isSelected ? 40 : 34,
              height: isSelected ? 40 : 34,
              padding: EdgeInsets.all(isSelected ? 9 : 7),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff087443)
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: AnimatedSwitcher(
                duration: duration,
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.7, end: 1).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutBack,
                      ),
                    ),
                    child: child,
                  ),
                ),
                child: SvgPicture.asset(
                  isSelected ? activeIconPath : inactiveIconPath,
                  key: ValueKey<bool>(isSelected),
                  colorFilter: ColorFilter.mode(
                    isSelected ? Colors.white : Colors.grey,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            AnimatedSize(
              duration: duration,
              curve: curve,
              alignment: Alignment.centerRight,
              child: isSelected && label.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: duration,
                        curve: curve,
                        builder: (context, value, child) => Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(8 * (1 - value), 0),
                            child: child,
                          ),
                        ),
                        child: Text(
                          label,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff176b4d),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}