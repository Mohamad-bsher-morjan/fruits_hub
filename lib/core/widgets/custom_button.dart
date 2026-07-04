import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    required this.title,
    this.textColor,
    this.onPressed,
  });

  final Color? backgroundColor, textColor;
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          backgroundColor: backgroundColor ?? Color(0xff4DB7F2),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
