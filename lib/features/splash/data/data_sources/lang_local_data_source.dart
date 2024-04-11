import 'package:quotes/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocalDataSource {
  Future<bool> changeLang(String langCode);

  Future<String> getSavedLang();
}

class LangLocalDataSourceImp implements LangLocalDataSource {
  LangLocalDataSourceImp(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<bool> changeLang(String langCode) async {
    return await sharedPreferences.setString(AppStrings.locale, langCode);
  }

  @override
  Future<String> getSavedLang() async {
    return sharedPreferences.getString(AppStrings.locale) ?? AppStrings.englishCode;
  }
}
