import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/app_interceptors.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:quotes/core/network/network_status.dart';
import 'package:quotes/features/random_quotes/data/data_sources/quote_local_data_source.dart';
import 'package:quotes/features/random_quotes/data/data_sources/quote_remote_data_source.dart';
import 'package:quotes/features/random_quotes/data/repositories/quote_repository_imp.dart';
import 'package:quotes/features/random_quotes/domain/repositories/quote_repository.dart';
import 'package:quotes/features/random_quotes/domain/use_cases/get_random_quote.dart';
import 'package:quotes/features/random_quotes/presentation/logic/random_quote_cubit.dart';
import 'package:quotes/features/splash/data/data_sources/lang_local_data_source.dart';
import 'package:quotes/features/splash/data/repositories/lang_repository_imp.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repository.dart';
import 'package:quotes/features/splash/domain/use_cases/change_local_use_case.dart';
import 'package:quotes/features/splash/domain/use_cases/get_saved_lang_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> inIt() async {
  /// Features
  // Blocs
  sl.registerFactory(() => QuoteCubit(sl()));

  // Use Cases
  sl.registerLazySingleton<GetRandomQuoteUseCases>(() => GetRandomQuoteUseCases(sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(() => GetSavedLangUseCase(sl()));
  sl.registerLazySingleton<ChangeLocalUseCase>(() => ChangeLocalUseCase(sl()));

  // Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImp(sl(), sl(), sl()));
  sl.registerLazySingleton<LangRepository>(() => LangRepositoryImp(sl()));

  // Data Sources
  sl.registerLazySingleton<QuoteLocalDataSource>(() => QuoteLocalDataSourceImp(sl()));
  sl.registerLazySingleton<QuoteRemoteDataSource>(() => QuoteRemoteDataSourceImp(sl()));
  sl.registerLazySingleton<LangLocalDataSource>(() => LangLocalDataSourceImp(sl()));

  /// Core
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImp(sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));

  /// External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());
  sl.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
}
