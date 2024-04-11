import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/splash/domain/use_cases/change_local_use_case.dart';
import 'package:quotes/features/splash/domain/use_cases/get_saved_lang_use_case.dart';

part 'local_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(this._changeLocalUseCase, this._getSavedLangUseCase)
      : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));

  final ChangeLocalUseCase _changeLocalUseCase;
  final GetSavedLangUseCase _getSavedLangUseCase;

  String _currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final result = await _getSavedLangUseCase(NoParams());
    result.fold((failure) => debugPrint(AppStrings.localFailure), (value) {
      _currentLangCode = value;
      emit(ChangeLocaleState(Locale(_currentLangCode)));
    });
  }

  Future<void> _changeLocal(String langCode) async {
    final result = await _changeLocalUseCase(langCode);
    result.fold((failure) => debugPrint(AppStrings.localFailure), (value) {
      _currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(_currentLangCode)));
    });
  }

  void toEnglish() => _changeLocal(AppStrings.englishCode);

  void toArabic() => _changeLocal(AppStrings.arabicCode);
}
