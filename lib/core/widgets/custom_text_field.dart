import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
    this.controller,
    this.validator,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final bool? enabled;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      enableInteractiveSelection: enableInteractiveSelection,
      obscureText: obscureText,
      onSaved: onSaved,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: AppStyles.bold13.copyWith(color: context.palette.hint),
        hintText: hintText,
        filled: true,
        fillColor: context.palette.fieldFill,
        border: buildBorder(context),
        enabledBorder: buildBorder(context),
        focusedBorder: buildBorder(context),
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
