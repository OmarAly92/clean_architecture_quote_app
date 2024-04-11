import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/features/splash/data/data_sources/lang_local_data_source.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repository.dart';

class LangRepositoryImp implements LangRepository {
  LangRepositoryImp(this.langLocalDataSource);

  final LangLocalDataSource langLocalDataSource;

  @override
  Future<Either<Failures, bool>> changeLang(String langCode) async {
    try {
      final result = await langLocalDataSource.changeLang(langCode);
      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failures, String>> getSavedLang() async {
    try {
      final result = await langLocalDataSource.getSavedLang();
      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure());
    }
  }
}
