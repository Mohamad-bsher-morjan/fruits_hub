import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EditIconButton extends StatelessWidget {
  const EditIconButton({
    super.key,
    required this.isEditing,
    required this.onPressed,
  });

  final bool isEditing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isEditing ? LucideIcons.check : LucideIcons.edit3,
        size: 20,
        color: Colors.grey,
      ),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      tooltip: isEditing ? 'تم' : 'تعديل',
    );
  }
}
