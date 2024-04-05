import 'package:flutter/cupertino.dart';
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
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        color: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        foregroundColor: Colors.white,
        splashColor: CupertinoColors.systemOrange,
        iconSize: 32,
        enableFeedback: true,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
      ),
    );
  }
}
