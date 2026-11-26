import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class FormSectionTitle extends StatelessWidget {
  const FormSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(title, style: AppStyles.bold13)]);
  }
}
