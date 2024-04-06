import 'package:quotes/features/random_quotes/data/models/quote_model.dart';

abstract class QuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();

  Future<void> cacheQuote(QuoteModel quote);
}
