import 'dart:math';

import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

import '../HomeScreen/home_screen_provider.dart';
import '../widgets/comment_section_button.dart';
import '../widgets/tab_button.dart';

class ActOfKindnessScreen extends StatefulWidget {
  const ActOfKindnessScreen({Key? key}) : super(key: key);

  @override
  State<ActOfKindnessScreen> createState() => _ActOfKindnessScreenState();
}

class _ActOfKindnessScreenState extends State<ActOfKindnessScreen> {
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
                child: Column(children: [
                  Container(
                    height: 110,
                    color: Color(0xffC60000),
                    child: CustomAppBarWidget(
                      txt: "Act Of Kindness",
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
                  Column(children: [
                    TabButton(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
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
                                        child: Text(
                                          "Spontaneous",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 130,
                                ),
                                Container(
                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                        height: 400,
                        width: 500,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(children: [
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
                                      ),
                                      child: Text(
                                        "Spontaneous",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "So you’re going abroad, you’ve chosen your destination and now you have to choose a hotel. We will make some arrangements. So you are going abroad,..  ",
                                style: TextStyle(color: Colors.black45)),
                          ),
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
                        ]),
                      ),
                    ),
                  ]),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
