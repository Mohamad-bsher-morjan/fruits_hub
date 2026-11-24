
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/model/menu_item_model.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/menu_item_widget.dart';

class MenuItemsWidgetListView extends StatelessWidget {
  MenuItemsWidgetListView({super.key});

  final List<MenuItemModel> items = [
    MenuItemModel(title: 'الملف الشخصي', icon: Icons.person_outline, onTap: () {  }),
    MenuItemModel(title: 'طلباتي', icon: Icons.shopping_bag_outlined, onTap: () {  }),
    MenuItemModel(title: 'مفضلاتي', icon: Icons.favorite_outline, onTap: () {  }),
    MenuItemModel(title: 'الإشعارات', icon: Icons.notifications_outlined, onTap: () {  }),
    MenuItemModel(title: 'اللغة', icon: Icons.language, onTap: () {  }),
    MenuItemModel(title: 'المشاركة', icon: Icons.share_outlined, onTap: () {  }),
    MenuItemModel(title: 'التواصل', icon: Icons.contact_page_outlined, onTap: () {  }),
    MenuItemModel(title: 'المساعدة', icon: Icons.help_outline, onTap: () {  }),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return MenuItemWidget(item: items[index],);
      },
    );
  }
}
