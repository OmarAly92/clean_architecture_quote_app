import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quotes/core/utils/app_colors.dart';

import '../../../../data/models/quotes_content_model.dart';

class QuotesContent extends StatelessWidget {
  const QuotesContent({super.key, required this.quotesContentModel});

  final QuotesContentModel quotesContentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          const Gap(15),
          Text(
            quotesContentModel.quote,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(20),
          Text(
            quotesContentModel.author,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(15),
        ],
      ),
    );
  }
}
