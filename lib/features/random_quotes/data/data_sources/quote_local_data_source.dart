import 'dart:convert';

import 'package:quotes/features/random_quotes/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';

abstract class QuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();

  Future<void> cacheQuote(QuoteModel quote);
}

class QuoteLocalDataSourceImp implements QuoteLocalDataSource {
  QuoteLocalDataSourceImp(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<QuoteModel> getLastRandomQuote() async {
    final jsonQuote = sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonQuote != null) {
      final localCacheRandomQuote = QuoteModel.fromJson(jsonDecode(jsonQuote));
      return localCacheRandomQuote;
    } else {
      throw LocalException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) {
    final Map<String, dynamic> quoteMap = quote.toJson();
    final String jsonQuote = jsonEncode(quoteMap);
    return sharedPreferences.setString(AppStrings.cachedRandomQuote, jsonQuote);
  }
}
