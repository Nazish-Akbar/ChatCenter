import 'dart:math';

import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:chatapp/Screen/top_givers/friend_model.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:chatapp/Screen/widgets/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_friend.dart';
import '../widgets/d_w_m_tab.dart';

class TopBadgesScreen extends StatefulWidget {
  @override
  State<TopBadgesScreen> createState() => _TopBadgesScreenState();
}

class _TopBadgesScreenState extends State<TopBadgesScreen> {
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
          color: Color(0xffC60000),
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: SafeArea(
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      color: Color(0xffC60000),
                      child: CustomAppBarWidget(
                        txt: "Top Badges",
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
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TabButton(),
                          DMWTabButton(),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: ListView.builder(
                              itemCount: personList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 5),
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CustomFriend(
                                  title: personList[index].title,
                                  subtitle: personList[index].subtile,
                                  image1: personList[index].image1,
                                );
                              },
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
