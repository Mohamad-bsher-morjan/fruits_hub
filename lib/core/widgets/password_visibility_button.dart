import 'package:flutter/material.dart';

class PasswordVisibilityButton extends StatelessWidget {
  const PasswordVisibilityButton({
    super.key,
    required this.isObscured,
    required this.onPressed,
  });

  final bool isObscured;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isObscured ? Icons.visibility_off : Icons.visibility,
        size: 20,
        color: Colors.grey,
      ),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      tooltip: isObscured ? 'إظهار' : 'إخفاء',
    );
  }
}
