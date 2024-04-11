import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_locale/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../splash/presentation/logic/local_cubit.dart';
import '../logic/random_quote_cubit.dart';
import 'widgets/quotes_component/quotes_body.dart';

class QuotesView extends StatelessWidget {
  const QuotesView({super.key});

  void getRandomQuote(BuildContext context) {
    BlocProvider.of<QuoteCubit>(context).getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future(() => getRandomQuote(context)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                BlocProvider.of<LocaleCubit>(context).toArabic();
              } else {
                BlocProvider.of<LocaleCubit>(context).toEnglish();
              }
            },
            icon: Icon(
              Icons.translate_rounded,
              color: AppColors.primary,
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.translate('app_name')!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const QuotesBody(),
      ),
    );
  }
}
