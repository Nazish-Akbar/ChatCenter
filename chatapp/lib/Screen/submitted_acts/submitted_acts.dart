import 'dart:math';
import 'dart:ui';

import 'package:chatapp/Screen/HomeScreen/home_screen_provider.dart';
import 'package:chatapp/Screen/nomination_list_screen/nomination_list_screen.dart';
import 'package:chatapp/Screen/oppertunities_screen/opportunities_list_tile.dart';
import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/comment_section_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_row.dart';
import '../widgets/tab_button.dart';

class SubmittedActs extends StatefulWidget {
  SubmittedActs({Key? key}) : super(key: key);

  @override
  State<SubmittedActs> createState() => _SubmittedActsState();
}

class _SubmittedActsState extends State<SubmittedActs> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
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
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      color: Color(0xffC60000),
                      child: CustomAppBarWidget(
                        txt: "Submitted Acts",
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
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NominationScreenButtons(
                              onpress: () {},
                              BText: "Pending",
                              color: Colors.grey.shade400,
                            ),
                            NominationScreenButtons(
                              onpress: () {},
                              BText: "Approved",
                              color: Color(0xffC60000),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 430,
                            width: 500,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/img6.png'),
                                        //radius: 20,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text("Name Here"),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 25,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.blue,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3, left: 5, right: 5),
                                              child: Text(
                                                "Spontaneous",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 150,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade400),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.message_rounded),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("47"),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                    "Lloyd Was Too Helpfull Today By Talking to\nMy Mother ",
                                    style: TextStyle(color: Colors.black45)),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 210,
                                  width: 370,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/img6.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      MyWidget(),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Connie And 56 Others Like it",
                                        style: TextStyle(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    CommentButtons(
                                      txt: "Applaud",
                                    ),
                                    CommentButtons(
                                      txt: "Comment",
                                    ),
                                    CommentButtons(
                                      txt: "Share",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: 330,
                            width: 500,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/img6.png'),
                                        //radius: 20,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text("Name Here"),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 25,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3, left: 5, right: 5),
                                              child: Text(
                                                "Spontaneous",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                    "Lloyd Was Too Helpfull Today By Talking to\nMy Mother ",
                                    style: TextStyle(color: Colors.black45)),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 20, bottom: 10),
                                  child: Text(
                                      "Write Paragraph Here,Write ParagraphHere Write Paragraph Here,\nWrite Paragraph HereWrite Paragraph Here Write Paragraph Here\nWrite Paragraph HereWrite Paragraph Here Write Paragraph Here"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      MyWidget(),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Connie And 56 Others Like it",
                                        style: TextStyle(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    CommentButtons(
                                      txt: "Applaud",
                                    ),
                                    CommentButtons(
                                      txt: "Comment",
                                    ),
                                    CommentButtons(
                                      txt: "Share",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
