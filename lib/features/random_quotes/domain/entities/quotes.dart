import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  const QuoteEntity({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.length,
  });

  final String id;
  final String author;
  final String content;
  final List<String> tags;
  final int length;

  @override
  List<Object> get props => [id, author, content, tags, length];
}
