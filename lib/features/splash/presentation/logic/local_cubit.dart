import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_strings.dart';

part 'local_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));
}
