import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;
  AdaptiveFlatButton({this.text, this.handler});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              'Choose Date',
              style: TextStyle(fontSize: 15.0),
            ),
          )
        : FlatButton(
            onPressed: handler,
            textColor: Theme.of(context).accentColor,
            child: Text(
              'Choose Date',
              style: TextStyle(fontSize: 15.0),
            ),
          );
  }
}
