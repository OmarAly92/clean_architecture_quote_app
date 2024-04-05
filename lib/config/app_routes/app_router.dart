import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';

import 'routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const Text('data');
          },
        );
    }
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        );
      },
    );
  }
}
