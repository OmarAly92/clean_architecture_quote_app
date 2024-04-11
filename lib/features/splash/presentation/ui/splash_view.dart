import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_images.dart';

import '../../../../config/app_routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacementNamed(context, Routes.quotesView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppImages.quote)),
    );
  }
}
