
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/model/menu_item_model.dart';




class MenuItemWidget extends StatelessWidget {
  final MenuItemModel item;

  const MenuItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        item.icon,
        color: AppColors.primaryColor,
        size: 22,
      ),
      title: Text(
        item.title,
        style: AppStyles.regular13,
        textAlign: TextAlign.right,
      ),
      trailing: item.trailing ??
          const Icon(
            Icons.chevron_left,
            color: Color(0xFF949D9E),
          ),
      onTap: item.onTap,
    );
  }
}

