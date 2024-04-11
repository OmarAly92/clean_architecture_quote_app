import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'config/app_routes/app_router.dart';
import 'config/app_themes/app_themes.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/service_locator.dart' as locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator.inIt();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());

  // BlocOverrides.runZoned(() {
  //   runApp(const MyApp());
  // }, blocObserver: AppBlocObserver());
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
      // home: const CustomNavBar(),
    );
  }
}
