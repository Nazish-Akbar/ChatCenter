import 'dart:math';

import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_appbar_widget.dart';
import 'friends_screen_container.dart';

class Friends_Screen extends StatefulWidget {
  @override
  Friends_ScreenState createState() => Friends_ScreenState();
}

class Friends_ScreenState extends State<Friends_Screen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      DrawerScreen(),
      AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.6 : 1.0)
          ..rotateZ(isDrawerOpen ? pi / 280 : 0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 120,
                  color: Color(0xffC60000),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomAppBarWidget(
                      txt: "Friends",
                      onPressed: () {
                        if (isDrawerOpen) {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            isDrawerOpen = false;
                          });
                        } else {
                          if (!isDrawerOpen) {
                            setState(() {
                              xOffset = size.width - 100;
                              yOffset = size.height / 5;
                              isDrawerOpen = true;
                            });
                          }
                        }
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.all(10),
                      childAspectRatio: 3 / 2,
                      crossAxisCount: 2,
                      // mainAxisSpacing: 20,
                      // crossAxisSpacing: 20,
                      children: [
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                        Expanded(
                          child: container(
                            title1: "Name",
                            title2: "Here",
                          ),
                        ),
                      ],
                      //
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
