import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: context.palette.surface,
        border: Border(top: BorderSide(color: context.palette.divider, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(
            context: context,
            index: 0,
            activeIconPath: Assets.imagesVuesaxBoldHome,
            inactiveIconPath: Assets.imagesVuesaxOutlineHome,
            label: 'الرئيسية',
          ),
          _buildItem(
            context: context,
            index: 1,
            activeIconPath: Assets.imagesVuesaxBoldProducts,
            inactiveIconPath: Assets.imagesVuesaxOutlineProducts,
            label: 'المنتجات',
          ),
          _buildItem(
            context: context,
            index: 2,
            activeIconPath: Assets.imagesVuesaxBoldShoppingCart,
            inactiveIconPath: Assets.imagesVuesaxOutlineShoppingCart,
            label: 'سلة التسوق',
          ),
          _buildItem(
            context: context,
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
    required BuildContext context,
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
          color: isSelected
              ? context.palette.selectedSurface
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: context.palette.accent.withValues(alpha: 0.18),
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
                    ? AppColors.primaryColor
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
                    isSelected
                      ? context.palette.onPrimary
                      : context.palette.mutedIcon,
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
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: context.palette.accent,
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
