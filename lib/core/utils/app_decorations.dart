import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';

abstract class AppDecorations {
  static ShapeDecoration greyBoxDecoration(BuildContext context) {
    return ShapeDecoration(
      color: context.palette.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}
