import 'package:chatapp/Screen/HomeScreen/HomeScreen.dart';
import 'package:chatapp/Screen/friends_screen/friends_screen.dart';
import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:flutter/material.dart';

class DrawerWrapper extends StatelessWidget {
  const DrawerWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DrawerScreen(),
        HomeScreen(),
      ],
    ));
  }
}
