import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quotes/config/app_locale/app_localizations.dart';
import 'package:quotes/core/utils/app_colors.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, this.failureMsg, this.onPressed});

  final String? failureMsg;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: AppColors.primary,
          size: 250,
        ),
        Text(
          failureMsg ?? AppLocalizations.of(context)!.translate('something_went_wrong')!,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(20),
        Text(
          AppLocalizations.of(context)!.translate('try_again')!,
          style: const TextStyle(
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
          onPressed: onPressed,
          child: Text(
            AppLocalizations.of(context)!.translate('reload_screen')!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const Gap(200),
      ],
    );
  }
}
