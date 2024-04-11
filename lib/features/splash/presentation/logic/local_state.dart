part of 'local_cubit.dart';

sealed class LocaleState extends Equatable {
  const LocaleState(this.locale);

  final Locale locale;
}

class ChangeLocaleState extends LocaleState {
  const ChangeLocaleState(super.selectedLocale);

  @override
  List<Object> get props => [locale];
}
