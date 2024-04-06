import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/random_quotes/domain/entities/quotes.dart';

import '../repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<QuoteEntity, NoParams> {
  GetRandomQuote(this.quoteRepository);

  final QuoteRepository quoteRepository;

  @override
  Future<Either<Failures, QuoteEntity>> call(NoParams noParams) {
    return quoteRepository.getRandomQuote(noParams);
  }
}
