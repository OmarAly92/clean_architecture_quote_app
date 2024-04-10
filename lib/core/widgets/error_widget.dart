import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quotes/core/utils/app_colors.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, this.failureMsg});

  final String? failureMsg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          const Gap(20),
          Icon(
            Icons.error_outline,
            color: AppColors.primary,
            size: 150,
          ),
          Text(
            failureMsg ?? 'Something went wrong',
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(20),
          const Text(
            'Please try again',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 55,
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Reload Screen',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
