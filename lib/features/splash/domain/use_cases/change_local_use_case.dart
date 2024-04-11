import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repository.dart';

class ChangeLocalUseCase implements UseCase<bool, String> {
  ChangeLocalUseCase(this._langRepository);

  final LangRepository _langRepository;

  @override
  Future<Either<Failures, bool>> call(String langCode) async {
    return await _langRepository.changeLang(langCode);
  }
}
