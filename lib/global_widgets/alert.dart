import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bondy/styles/app_theme.dart';
import 'package:bondy/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:get/get.dart';

class Alert {

  static Future showAlert(String title, String text,
      {onPressed, barrierDismissible}) {
    var context = Get.context;
    return showDialog(
      context: context!,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Styles.regularText(context, title),
          content: Styles.regularText(context, text, color: Theme.of(context).textTheme.bodyText1!.color),
          actions: <Widget>[
            TextButton(
              child: Text(
                S.of(context).ok.toUpperCase(),
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onPressed: () {
                if (onPressed != null) {
                  onPressed();
                } else {
                  Get.back();
                }
              },
            ),
          ],
        );
      },
    );
  }

  static Future showAlertConfirm(
      String title, String text, onConfirmPressed, BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Styles.regularText(context, title),
          content: Styles.regularText(context, text, color: Theme.of(context).textTheme.bodyText1!.color),
          actions: <Widget>[
            TextButton(
              child: Text(
                S.of(context).cancel,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(
                S.of(context).confirm,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onPressed: () {
                if (onConfirmPressed != null) {
                  onConfirmPressed();
                } else {
                  Get.back();
                }
              },
            ),
          ],
        );
      },
    );
  }

  static Future showAlertError() {
    var context = Get.context!;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Styles.regularText(context, S.of(context).alertServerErrorTitle),
          content: Styles.regularText(context, S.of(context).alertServerErrorText, color: Theme.of(context).textTheme.bodyText1!.color),
          actions: <Widget>[
            TextButton(
              child: Text(
                S.of(context).ok.toUpperCase(),
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
