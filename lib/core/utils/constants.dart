import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Constants {
  static void showErrorDialog(BuildContext context, {required String message}) {
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
}
