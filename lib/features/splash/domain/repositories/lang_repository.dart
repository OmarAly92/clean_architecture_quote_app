import 'package:dartz/dartz.dart';

import '../../../../core/error/error_handler.dart';

abstract class LangRepository {
  Future<Either<Failures, bool>> changeLang(String langCode);

  Future<Either<Failures, String>> getSavedLang();
}
