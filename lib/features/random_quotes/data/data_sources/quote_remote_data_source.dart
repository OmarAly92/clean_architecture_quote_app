import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes/core/api/end_points.dart';
import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quotes/data/models/quote_model.dart';

abstract class QuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class QuoteRemoteDataSourceImp implements QuoteRemoteDataSource {
  const QuoteRemoteDataSourceImp(this.client);

  final http.Client client;

  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuoteUrl = Uri.parse('${EndPoints.baseUrl}${EndPoints.randomQuotes}');
    final response = await client.get(
      randomQuoteUrl,
      headers: {AppStrings.contentType: AppStrings.applicationJson},
    );
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
