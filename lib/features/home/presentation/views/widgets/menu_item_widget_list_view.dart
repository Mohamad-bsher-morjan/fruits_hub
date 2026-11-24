import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/model/menu_item_model.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/menu_item_widget.dart';

class MenuItemsWidgetListView extends StatefulWidget {
  const MenuItemsWidgetListView({super.key});

  @override
  State<MenuItemsWidgetListView> createState() =>
      _MenuItemsWidgetListViewState();
}

class _MenuItemsWidgetListViewState extends State<MenuItemsWidgetListView> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final List<MenuItemModel> items = [
      MenuItemModel(
        title: 'الملف الشخصي',
        icon: Icons.person_outline,
        onTap: () {},
      ),
      MenuItemModel(
        title: 'طلباتي',
        icon: Icons.shopping_bag_outlined,
        onTap: () {},
      ),
      MenuItemModel(
        title: 'مفضلاتي',
        icon: Icons.favorite_outline,
        onTap: () {},
      ),
      MenuItemModel(
        title: 'الإشعارات',
        icon: Icons.notifications_outlined,
        onTap: () {},
        trailing: Switch(
          value: notificationsEnabled,
          onChanged: (value) {
            setState(() {
              notificationsEnabled = value;
            });
          },
        ),
      ),
      MenuItemModel(title: 'اللغة', icon: Icons.language, onTap: () {}),
      MenuItemModel(
        title: 'الوضع',
        icon: FontAwesomeIcons.magic,
        onTap: () {},
        trailing: Switch(
          value: notificationsEnabled,
          onChanged: (value) {
            setState(() {
              notificationsEnabled = value;
            });
          },
        ),
      ),
      MenuItemModel(title: 'من نحن', icon: Icons.help_outline, onTap: () {}),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return MenuItemWidget(item: items[index]);
      },
    );
  }
}
