import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';

import '../../config/app_locale/app_localizations.dart';

class AppConstants {
  static void showErrorDialog(
    BuildContext context, {
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  static void showToast({
    required String message,
    ToastGravity? gravity,
    Color? color,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.primary,
      textColor: textColor,
    );
  }

  static String mapFailureMsg(Failure failure) {
    if (failure is ServerException) {
      return failure.message ?? AppStrings.unexpectedError;
    } else if (failure is LocalFailure) {
      return AppStrings.localFailure;
    } else {
      return AppStrings.unexpectedError;
    }
  }
}

String translate(BuildContext context, String key) {
  return AppLocalizations.of(context)!.translate(key)!;
}
