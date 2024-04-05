import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quotes/presentation/ui/quotes_view.dart';

import 'routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.quotesView:
        return MaterialPageRoute(
          builder: (context) {
            return const QuotesView();
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
