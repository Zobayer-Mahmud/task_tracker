import 'package:flutter/material.dart';

class AppDialog {
  static Future<bool> showConfirmationDialog(BuildContext context,
      {String? title}) async {
    bool result = false;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: Text(title ?? 'Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
                result = false;
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                result = true;
              },
            ),
          ],
        );
      },
    );
    return result;
  }
}
