import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/core/utils/constants.dart';

import '../../domain/entities/quotes.dart';
import '../../domain/use_cases/get_random_quote.dart';

part 'random_quote_state.dart';

class QuoteCubit extends Cubit<RandomQuoteState> {
  QuoteCubit(this._getRandomQuoteUseCases) : super(RandomQuoteInitial());

  final GetRandomQuoteUseCases _getRandomQuoteUseCases;

  Future<void> getRandomQuote() async {
    emit(GetRandomQuoteLoading());
    final result = await _getRandomQuoteUseCases(NoParams());
    result.fold(
      (failure) {
        emit(GetRandomQuoteFailure(AppConstants.mapFailureMsg(failure)));
      },
      (quote) {
        emit(GetRandomQuoteSuccess(quote));
      },
    );
  }
}
