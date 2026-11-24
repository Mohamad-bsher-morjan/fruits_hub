import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.controller,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            offset: Offset(0, 2),
            blurRadius: 9,
            color: context.palette.shadow,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.imagesSearchIcon,
                colorFilter: ColorFilter.mode(
                  context.palette.accent,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.imagesFilter,
                colorFilter: ColorFilter.mode(
                  context.palette.mutedIcon,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          hintStyle: AppStyles.regular13.copyWith(
            color: context.palette.hint,
          ),
          hintText: 'ابحث عن.....',
          filled: true,
          fillColor: context.palette.fieldFill,
          border: buildBorder(context),
          enabledBorder: buildBorder(context),
          focusedBorder: buildBorder(context),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: context.palette.border),
    );
  }
}
