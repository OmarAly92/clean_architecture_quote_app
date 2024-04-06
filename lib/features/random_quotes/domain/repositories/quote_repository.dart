import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/quotes.dart';

abstract class QuoteRepository {
  Future<Either<Failures, QuoteEntity>> getRandomQuote(NoParams params);
}
