import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final SvgPicture;
  CustomAvatar({this.SvgPicture});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: Color(0xffF5F5F5),
        child: ClipRRect(
          child: SvgPicture,
          // child: Image.asset('profile-generic.png'),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
