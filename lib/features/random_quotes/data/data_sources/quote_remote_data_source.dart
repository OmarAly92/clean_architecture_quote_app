import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/end_points.dart';
import 'package:quotes/features/random_quotes/data/models/quote_model.dart';

abstract class QuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class QuoteRemoteDataSourceImp implements QuoteRemoteDataSource {
  const QuoteRemoteDataSourceImp(this.apiConsumer);

  final ApiConsumer apiConsumer;

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(EndPoints.randomQuotes);
    return QuoteModel.fromJson(response);
  }
}
