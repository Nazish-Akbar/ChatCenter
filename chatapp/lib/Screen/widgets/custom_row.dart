import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String txt2;
  final onTap;
  const CustomRow({
    required this.txt2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt2,
          style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 150,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            "View More",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Color(0xffC60000),
            ),
          ),
        ),
      ],
    );
  }
}
