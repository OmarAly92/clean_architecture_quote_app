import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';

abstract class AppThemes {
  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
