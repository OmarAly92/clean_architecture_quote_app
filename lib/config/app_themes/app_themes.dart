import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

abstract class AppThemes {
  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      fontFamily: AppStrings.fontFamily,
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
