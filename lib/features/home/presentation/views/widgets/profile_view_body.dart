import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/menu_item_widget_list_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/profile_header.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            ProfileHeader(),
            const SizedBox(height: 24),
            MenuItemsWidgetListView(),
            const SizedBox(height: 24),
            CustomButton(title: 'تسجيل الخروج', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

  