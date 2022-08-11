import 'dart:math';

import 'package:chatapp/Screen/friends_screen/friends_screen.dart';
import 'package:chatapp/Screen/recognization_screen/recognization_screen.dart';
import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:chatapp/Screen/widgets/custom_friend_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../HomeScreen/home_screen_provider.dart';
import '../friend_request_screen/friend_request_screen.dart';
import '../widgets/comment_section_button.dart';

//user profile screen
class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var stack = Stack(
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
          child: SafeArea(
            child: Scaffold(
              // bottomSheet: CustomAppBarWidget(
              // onPressed: () {},
              //txt: "hi",
              //),
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    color: Color.fromRGBO(198, 0, 0, 1),
                    height: 110,
                    child: CustomAppBarWidget(
                      txt: "Profile",
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
                    children: [
                      Container(
                        height: 300,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 260,
                              //width: ,
                              child: Image.asset(
                                'assets/img1.png',
                                fit: BoxFit.fill,
                                // width: 500,
                              ),
                            ),
                            Positioned(
                              // top: 100,
                              left: 50,
                              bottom: 1,
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage('assets/img7.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextWidget(HeadLinesText: "Name Here"),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text("Location"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                (MaterialPageRoute(
                                  builder: (context) => NotificationScreen(),
                                )),
                              );
                            },
                            child: Row(
                              children: [
                                TextWidget(HeadLinesText: "18"),
                                Text("Friends"),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              TextWidget(HeadLinesText: "317"),
                              Text("Agape Tokens"),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget(HeadLinesText: "1.3K"),
                              Text("Applaud"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    HeadLinesText: "Agape Badges",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        latestacheivementsrow(
                          svgImg: "assets/level1.svg",
                          Rtext: "",
                        ),
                        latestacheivementsrow(
                          svgImg: "assets/level2.svg",
                          Rtext: "",
                        ),
                        latestacheivementsrow(
                          svgImg: "assets/level3.svg",
                          Rtext: "",
                        ),
                        latestacheivementsrow(
                          svgImg: "assets/level4.svg",
                          Rtext: "",
                        ),
                        latestacheivementsrow(
                          svgImg: "assets/level5.svg",
                          Rtext: "",
                        ),
                      ],
                    ),
                  ),
                  TextWidget(HeadLinesText: "About"),
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 197, 197, 197),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                          "A Passionate coder.Loves to swim and dance.An Enthusiastic Designer. Loves reading books. Always being positive.Sarcastic humor."),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Act Of Kindness"),
                      Text(
                        "View More",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xffC60000),
                        ),
                      )
                    ],
                  ),
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3.0, left: 5, right: 5),
                                        child: Text(
                                          "Spontaneous",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
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
                                    color: Colors.grey.shade300),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.message_outlined,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 3,
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
                      height: 300,
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 5, right: 5),
                                        child: Text(
                                          "Spontaneous",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 130,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade300),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.message_outlined,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text("47"),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Lloyd Was Too Helpfull Today By Talking to\nMy Mother ",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // height: 90,
                            width: 370,
                            child: Text(
                                "So you’re going abroad, you’ve chosen your destination and now you have to choose a hotel. We will make some arrangements. We will make some arrangements."),
                          ),
                          SizedBox(
                            height: 10,
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
                ]),
              ),
            ),
          ),
        ),
      ],
    );
    return stack;
  }
}
