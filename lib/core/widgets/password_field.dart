import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

bool isPasswordVisible = true;

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isPasswordVisible,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
        child: isPasswordVisible
            ? Icon(Icons.visibility_off, color: context.palette.mutedIcon)
            : Icon(Icons.remove_red_eye, color: context.palette.mutedIcon),
      ),
    );
  }
}
