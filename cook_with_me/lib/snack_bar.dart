import 'package:flutter/material.dart';

class SnackBarSupport {
  static SnackBar createNotification(
      {required String content,
      required int timeSecond,
      String? lable,
      VoidCallback? onClicked}) {
    return SnackBar(
      content: Text(content),
      duration: Duration(seconds: timeSecond),
      action: SnackBarAction(
          label: lable!,
          onPressed: () {
            onClicked!();
          }),
    );
  }

  static void display(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void createAndDisplay(
      {required BuildContext context,
      required String content,
      required int timeSecond,
      required bool hideAction}) {
    final snackBar = SnackBar(
      content: Text(content),
      duration: Duration(seconds: timeSecond),
      action: hideAction
          ? SnackBarAction(
              onPressed: () {},
              label: 'Đã hiểu',
            )
          : null,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}