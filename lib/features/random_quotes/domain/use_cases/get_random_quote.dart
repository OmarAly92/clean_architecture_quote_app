import 'package:dartz/dartz.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/random_quotes/domain/entities/quotes.dart';

import '../../../../core/error/error_handler.dart';
import '../repositories/quote_repository.dart';

class GetRandomQuoteUseCases implements UseCase<QuoteEntity, NoParams> {
  GetRandomQuoteUseCases(this._quoteRepository);

  final QuoteRepository _quoteRepository;

  @override
  Future<Either<Failures, QuoteEntity>> call(NoParams noParams) {
    return _quoteRepository.getRandomQuote(noParams);
  }
}
