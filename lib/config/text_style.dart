import 'package:demo_structure/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle semiBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
    letterSpacing: 0,
  );

  static TextStyle medium = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
    letterSpacing: 0,
  );

  static TextStyle regular = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
    letterSpacing: 0,
  );
}