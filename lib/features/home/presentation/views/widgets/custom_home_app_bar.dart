import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: EdgeInsets.all(12),
        decoration: const ShapeDecoration(
          color: Color(0xffeef8ed),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير..!',
        textAlign: TextAlign.right,
        style: AppStyles.regular16.copyWith(color: Color(0xff949d9e)),
      ),
      subtitle: Text('بشر مرجان', style: AppStyles.bold16),
    );
  }
}
