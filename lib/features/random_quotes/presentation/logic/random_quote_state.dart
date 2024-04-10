part of 'random_quote_cubit.dart';

sealed class RandomQuoteState extends Equatable {
  const RandomQuoteState();
}

final class RandomQuoteInitial extends RandomQuoteState {
  @override
  List<Object> get props => [];
}

final class GetRandomQuoteLoading extends RandomQuoteState {
  @override
  List<Object> get props => [];
}

final class GetRandomQuoteSuccess extends RandomQuoteState {
  final QuoteEntity quote;

  const GetRandomQuoteSuccess(this.quote);

  @override
  List<Object> get props => [quote];
}

final class GetRandomQuoteFailure extends RandomQuoteState {
  final String failureMessage;

  const GetRandomQuoteFailure(this.failureMessage);

  @override
  List<Object> get props => [failureMessage];
}
