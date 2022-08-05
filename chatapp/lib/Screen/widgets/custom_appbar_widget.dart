import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../side_drawer/side_drawer.dart';
import 'custom_app_bar.dart';

class CustomAppBarWidget extends StatelessWidget {
  final txt;
  final onPressed;

  CustomAppBarWidget({this.txt, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onPressed,
              child: SvgPicture.asset(
                "assets/leadingicon.svg",
                height: 35,
                width: 35,
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Text(
              txt,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              width: 70,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SearchBar(
          hintText: "Search Here",
        ),
      ],
    );
  }
}

// class CustomAppBarWidget extends StatefulWidget {
//   final String txt;
//   final onPressed;
//   const CustomAppBarWidget({
//     required this.txt,
//     this.onPressed,
//   });

//   @override
//   State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
// }

// class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }