import 'package:flutter/material.dart';

import 'config/app_themes/app_themes.dart';
import 'core/utils/app_strings.dart';
import 'test/custom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light(),
      // onGenerateRoute: AppRouter.generateRoute,
      home: const CustomNavBar(),
    );
  }
}
