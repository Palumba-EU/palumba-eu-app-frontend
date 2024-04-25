import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class Alert {
  static Future showAlert(String title, String text, BuildContext context,
      {onPressed, barrierDismissible}) {
    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        barrierDismissible:
            barrierDismissible != null ? barrierDismissible : true,
        // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title, style: TextStyle(color: Colors.black),)),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(text, style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(S.of(context).ok),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context, //
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: new Text(
              title,
              style: TextStyle(letterSpacing: -0.3),
            ),
            content: Column(
              children: <Widget>[
                SizedBox(
                  height: 4,
                ),
                Text(
                  text,
                  style: TextStyle(height: 1.2),
                )
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(S.of(context).ok),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }

  static Future showAlertYesNo(
      String title, String text, onYesPressed, BuildContext context,
      {onNoPressed}) {
    if (Platform.isAndroid) {
      return showDialog(
        context: context, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(text),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(S.of(context).yes),
                onPressed: () {
                  Navigator.of(context).pop();
                  onYesPressed();
                },
              ),
              TextButton(
                child: Text(S.of(context).no),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onNoPressed != null) {
                    onNoPressed();
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context, //
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: new Text(title),
            content: new Text(text),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(S.of(context).yes),
                onPressed: () {
                  Navigator.of(context).pop();
                  onYesPressed();
                },
              ),
              CupertinoDialogAction(
                child: Text(S.of(context).no),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onNoPressed != null) {
                    onNoPressed();
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }
}
