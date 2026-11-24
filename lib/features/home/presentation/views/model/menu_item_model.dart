
import 'dart:ui';

import 'package:flutter/widgets.dart';

class MenuItemModel {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;

  const MenuItemModel({
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
  });
}
