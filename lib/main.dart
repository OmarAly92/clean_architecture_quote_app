import 'package:flutter/material.dart';

import 'core/utils/app_colors.dart';
import 'core/utils/app_strings.dart';
import 'features/random_quotes/presentation/ui/quotes_view.dart';

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
      theme: ThemeData(
        primaryColor: AppColors.primary,
        useMaterial3: true,
      ),
      home: const QuotesView(),
    );
  }
}
