import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(Assets.imagesProfileImage),
            ),
            Positioned(
              bottom: -5,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: context.palette.surface,
                    shape: BoxShape.circle,
                    border: Border.all(color: context.palette.border),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 18,
                    color: context.palette.accent,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أحمد سرب',
                style: AppStyles.bold16,
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 6),
              Text(
                'mail@mail.com',
                style: AppStyles.regular13.copyWith(
                  color: context.palette.hint,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
