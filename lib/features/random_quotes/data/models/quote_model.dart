import '../../domain/entities/quotes.dart';

class QuoteModel extends QuoteEntity {
  const QuoteModel({
    required super.id,
    required super.author,
    required super.content,
    required super.tags,
    required super.length,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["_id"] ?? 0,
        author: json["author"] ?? '',
        content: json["content"] ?? '',
        tags: List<String>.from((json["tags"] ?? []).map((x) => x)),
        length: json["length"] ?? 0,
      );

  @override
  List<Object> get props => [
        id,
        author,
        content,
        tags,
        length,
      ];
}
