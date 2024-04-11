import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';

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

  static mapFailureMsg(Failures failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return AppStrings.serverFailure;
      case const (LocalFailure):
        return AppStrings.localFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
