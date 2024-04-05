import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quotes/features/random_quotes/data/models/quotes_content_model.dart';
import 'package:quotes/features/random_quotes/presentation/ui/widgets/quotes_component/quotes_content.dart';

class QuotesBody extends StatelessWidget {
  const QuotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Gap(20),
          const QuotesContent(
            quotesContentModel: QuotesContentModel(
              quote:
                  'Measuring programming progress by lines of is like measuring aircraft building progress by weight',
              author: 'Bill Gates',
            ),
          ),
          const Gap(20),
          const Gap(20),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
