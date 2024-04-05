import 'package:flutter/material.dart';

import 'config/themes/app_themes.dart';
import 'core/app_routes/app_router.dart';
import 'core/utils/app_strings.dart';

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
      onGenerateRoute: AppRouter.generateRoute,
      // home: const QuotesView(),
    );
  }
}
