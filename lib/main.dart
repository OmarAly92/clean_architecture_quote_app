import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/app_locale/app_localizations_setup.dart';
import 'package:quotes/features/splash/presentation/logic/local_cubit.dart';

import 'bloc_observer.dart';
import 'config/app_routes/app_router.dart';
import 'config/app_themes/app_themes.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/service_locator.dart' as locator;
import 'core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator.inIt();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(sl(), sl())..getSavedLang(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: AppThemes.light(),
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
            locale: state.locale,
            onGenerateRoute: AppRouter.generateRoute,
            // home: const CustomNavBar(),
          );
        },
      ),
    );
  }
}
