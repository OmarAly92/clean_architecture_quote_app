import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/features/random_quotes/data/models/quotes_content_model.dart';
import 'package:quotes/features/random_quotes/presentation/logic/random_quote_cubit.dart';
import 'package:quotes/features/random_quotes/presentation/ui/widgets/quotes_component/quotes_content.dart';

import '../../../../../../core/widgets/error_widget.dart';

class QuotesBody extends StatefulWidget {
  const QuotesBody({super.key});

  @override
  State<QuotesBody> createState() => _QuotesBodyState();
}

class _QuotesBodyState extends State<QuotesBody> {
  @override
  void initState() {
    super.initState();
    getRandomQuote();
  }

  void getRandomQuote() {
    BlocProvider.of<QuoteCubit>(context).getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<QuoteCubit, RandomQuoteState>(
        builder: (context, state) {
          if (state is GetRandomQuoteLoading) {
            return Column(
              children: [
                const Gap(225),
                Center(
                  child: LoadingAnimationWidget.bouncingBall(
                    color: AppColors.primary,
                    size: 100,
                  ),
                ),
              ],
            );
          } else if (state is GetRandomQuoteSuccess) {
            return Column(
              children: [
                const Gap(125),
                Center(
                  child: QuotesContent(
                    quotesContentModel: QuotesContentModel(
                      quote: state.quote.content,
                      author: state.quote.author,
                    ),
                  ),
                ),
                const Gap(40),
                FloatingActionButton(
                  onPressed: () => getRandomQuote(),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          } else if (state is GetRandomQuoteFailure) {
            return Center(
              child: AppErrorWidget(
                failureMsg: state.failureMessage,
                onPressed: getRandomQuote,
              ),
            );
          } else {
            return const Text('unKnown state');
          }
        },
      ),
    );
  }
}
