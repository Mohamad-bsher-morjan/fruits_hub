import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  MenuItemModel({required this.title, required this.icon, required this.onTap});
}
