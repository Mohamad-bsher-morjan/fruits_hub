import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/theme/theme_provider.dart';
import 'package:fruits_hub/features/home/presentation/views/model/menu_item_model.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/menu_item_widget.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/personal_profile_view.dart';
import 'package:provider/provider.dart';

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
        onTap: () {
          Navigator.pushNamed(context, PersonalProfileView.routeName);
        },
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
        trailing: Consumer<ThemeProvider>(
          builder: (context, provider, child) {
            return PopupMenuButton<ThemeMode>(
              initialValue: provider.themeMode,
              onSelected: provider.setThemeMode,
              icon: Icon(Icons.brightness_4, color: context.palette.accent),
              tooltip: 'الوضع',
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: ThemeMode.system,
                  child: Text('حسب النظام'),
                ),
                PopupMenuItem(value: ThemeMode.light, child: Text('فاتح')),
                PopupMenuItem(value: ThemeMode.dark, child: Text('داكن')),
              ],
            );
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
