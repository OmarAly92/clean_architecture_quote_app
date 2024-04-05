import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import 'widgets/quotes_component/quotes_body.dart';

class QuotesView extends StatelessWidget {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
