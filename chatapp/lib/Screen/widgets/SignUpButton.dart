import 'dart:ui';

import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final String title;
  //final colorP;
  final onTap;
  SignUpButton({
    required this.title,
    //required this.colorP,
    required this.onTap,
    //  required MaterialColor Color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 300,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        //color: colorP,
        color: Color(0xffC60000),
        onPressed: onTap,
      ),
    );
  }
}
