import 'package:equatable/equatable.dart';

class QuotesContentModel extends Equatable {
  final String quote;
  final String author;

  const QuotesContentModel({
    required this.quote,
    required this.author,
  });

  @override
  List<Object> get props => [quote, author];
}
