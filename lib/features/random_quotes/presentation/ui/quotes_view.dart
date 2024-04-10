import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
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
          title: const Text(
            AppStrings.appName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const QuotesBody(),
      ),
    );
  }
}
