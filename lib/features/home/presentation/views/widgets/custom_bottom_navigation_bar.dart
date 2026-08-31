import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final void Function(int index)? onPressed;

  const CustomBottomNavigationBar({
    super.key,
    this.onPressed,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

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
            label: '',
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

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });

        // استدعاء onPressed الذي يأتي من الخارج
        widget.onPressed?.call(index);
      },
      child: isSelected
          ? Container(
              padding: EdgeInsets.only(
                left: label.isEmpty ? 10 : 8,
                right: label.isEmpty ? 10 : 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xfff1f4f2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(9),
                    decoration: const BoxDecoration(
                      color: Color(0xff087443),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        activeIconPath,
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  if (label.isNotEmpty) ...[
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff176b4d),
                      ),
                    ),
                  ],
                ],
              ),
            )
          : SizedBox(
              width: 45,
              height: 50,
              child: Center(
                child: SvgPicture.asset(
                  inactiveIconPath,
                  width: 22,
                  height: 22,
                  colorFilter: const ColorFilter.mode(
                    Colors.grey,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
    );
  }
}

