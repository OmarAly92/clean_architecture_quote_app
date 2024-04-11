import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';

abstract class LangRepository {
  Future<Either<Failures, bool>> changeLang(String langCode);

  Future<Either<Failures, String>> getSavedLang();
}
