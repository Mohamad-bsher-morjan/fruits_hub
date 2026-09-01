import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: NotificationWidget(),
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير..!',
        textAlign: TextAlign.right,
        style: AppStyles.regular16.copyWith(color: Color(0xff949d9e)),
      ),
      subtitle: Text(getUser().name, style: AppStyles.bold16),
    );
  }
}


