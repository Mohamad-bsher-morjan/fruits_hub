import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';

AppBar buildAppBar(
  BuildContext context,
  String text, {
  bool showNotification = true,
}) {
  return AppBar(
    actions: [
      Visibility(
        visible: showNotification,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(text, style: AppStyles.bold19),
  );
}
