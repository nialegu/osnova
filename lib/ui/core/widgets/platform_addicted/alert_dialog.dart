import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

Widget alert(String title, String text) {
  return Platform.isAndroid
      ? AndroidAlert(title: title, text: text)
      : IosAlert(title: title, text: text);
}

class AndroidAlert extends StatelessWidget {
  final String title;
  final String text;
  const AndroidAlert({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(text),
      actionsOverflowButtonSpacing: 20,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).ok),
        ),
      ],
    );
  }
}

class IosAlert extends StatelessWidget {
  final String title;
  final String text;
  const IosAlert({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).ok),
        ),
      ],
      content: Text(text),
    );
  }
}
