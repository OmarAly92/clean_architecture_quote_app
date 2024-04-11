import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quotes/presentation/logic/random_quote_cubit.dart';
import 'package:quotes/features/random_quotes/presentation/ui/quotes_view.dart';

import '../../core/utils/service_locator.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.quotesView:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => QuoteCubit(sl()),
              child: const QuotesView(),
            );
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
