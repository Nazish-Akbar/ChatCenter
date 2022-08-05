import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            height: 35,
            width: 35,
            color: Colors.white,
            child: SvgPicture.asset(
              "assets/picimg.svg",
              width: 30,
              height: 30,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Upload Photo'),
      ],
    );
  }
}
