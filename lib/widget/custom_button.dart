import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;

  final onPressed;

  const CustomButton({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 50,
        child: RaisedButton(
          color: Color(0xffC60000),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: onPressed,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
