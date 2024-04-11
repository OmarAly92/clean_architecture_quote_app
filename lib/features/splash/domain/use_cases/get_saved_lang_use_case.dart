import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repository.dart';

class GetSavedLangUseCase implements UseCase<String, NoParams> {
  GetSavedLangUseCase(this._langRepository);

  final LangRepository _langRepository;

  @override
  Future<Either<Failures, String>> call(NoParams noParams) async {
    return await _langRepository.getSavedLang();
  }
}
