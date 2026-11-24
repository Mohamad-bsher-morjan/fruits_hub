import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: context.palette.softSurface,
        shape: OvalBorder(),
      ),
      child: SvgPicture.asset(
        Assets.imagesNotification,
        colorFilter: ColorFilter.mode(
          context.palette.accent,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
