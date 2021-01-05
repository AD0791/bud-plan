import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveBtn extends StatelessWidget {
  final String text;
  final Function datePickerHandler;

  AdaptiveBtn(this.text,this.datePickerHandler)


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: datePickerHandler,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        : FlatButton(
            onPressed: datePickerHandler,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            textColor: Theme.of(context).primaryColor,
          );
  }
}
