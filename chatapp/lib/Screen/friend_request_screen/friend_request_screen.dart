import 'dart:math';
//friend request screen
import 'package:chatapp/Screen/friend_request_screen/friend_model.dart';
import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_friend_request.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
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
          child: Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      color: Color.fromRGBO(198, 0, 0, 1),
                      child: CustomAppBarWidget(
                        txt: "Friends Request",
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
                    SizedBox(
                      height: 10,
                    ),
                    Column(children: [
                      RichText(
                        text: TextSpan(children: <InlineSpan>[
                          TextSpan(
                            text: ' Friend Request',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: SizedBox(width: 10),
                          ),
                          TextSpan(
                            text: ' 256',
                            style: TextStyle(
                                color: Color(0xffC60000), fontSize: 16),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: SizedBox(width: 140),
                          ),
                          TextSpan(
                              text: 'see all ',
                              style: TextStyle(
                                  color: Color(0xffC60000), fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView.builder(
                          itemCount: personList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 16),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomFriendReques(
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
      ],
    );
  }
}
