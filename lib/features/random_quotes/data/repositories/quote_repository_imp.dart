import 'package:dartz/dartz.dart';
import 'package:quotes/core/network/network_status.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/random_quotes/domain/entities/quotes.dart';

import '../../../../core/error/error_handler.dart';
import '../../domain/repositories/quote_repository.dart';
import '../data_sources/quote_local_data_source.dart';
import '../data_sources/quote_remote_data_source.dart';

class QuoteRepositoryImp implements QuoteRepository {
  QuoteRepositoryImp(
    this.networkStatus,
    this.quoteRemoteDataSource,
    this.quoteLocalDataSource,
  );

  final NetworkStatus networkStatus;
  final QuoteRemoteDataSource quoteRemoteDataSource;
  final QuoteLocalDataSource quoteLocalDataSource;

  @override
  Future<Either<Failures, QuoteEntity>> getRandomQuote(NoParams params) async {
    final isConnected = await networkStatus.isConnected;
    if (isConnected) {
      try {
        final remoteRandomQuote = await quoteRemoteDataSource.getRandomQuote();
        quoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
      // try {
      //   final localRandomQuote = await quoteLocalDataSource.getLastRandomQuote();
      //   return Right(localRandomQuote);
      // } on LocalException catch (e) {
      //   return Left(LocalFailure(ResponseCode.cacheError, e.toString()));
      // }
    }
  }
}
