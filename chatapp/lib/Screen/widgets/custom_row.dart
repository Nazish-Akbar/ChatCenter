import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String txt2;
  const CustomRow({
    required this.txt2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          txt2,
          style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 150,
        ),
        Text(
          "View More",
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Color(0xffC60000),
          ),
        ),
      ],
    );
  }
}
