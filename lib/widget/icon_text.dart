import 'package:flutter/material.dart';

class icon_texts extends StatelessWidget {
  final String txt1;
  final String txt2;
  final onPressed;

  final IconData icon;
  icon_texts({
    required this.icon,
    required this.txt1,
    required this.txt2,
    this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
              ),
              Icon(
                icon,
                size: 25,
                color: Color(0xffC60000),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txt1,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    txt2,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
