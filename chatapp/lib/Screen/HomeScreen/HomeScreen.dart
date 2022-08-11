import 'dart:math';
import 'dart:ui';

import 'package:chatapp/Screen/HomeScreen/home_screen_provider.dart';
import 'package:chatapp/Screen/act_of_kindness/act_of_kindness_screen.dart';
import 'package:chatapp/Screen/oppertunities_screen/opportunities_list_tile.dart';
import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:chatapp/Screen/top_badges/top_badges_screen.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../top_givers/top_givers.dart';
import '../widgets/comment_section_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_row.dart';
import '../widgets/tab_button.dart';
import 'home_list_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    color: Color(0xffC60000),
                    child: Column(
                      children: [
                        CustomAppBarWidget(
                          txt: "Home",
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      TabButton(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: CustomRow(
                            txt2: "Act Of Kindness",
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActOfKindnessScreen(),
                                ),
                              );
                            }),
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
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
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
                                                left: 5.0, right: 5.0, top: 3),
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
                                    width: 150,
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
                        padding: const EdgeInsets.all(20.0),
                        child: CustomRow(
                          txt2: "Top Givers",
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TopGiver(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shadowColor: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomCardWidget(),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCardWidget(),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCardWidget(),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCardWidget(),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCardWidget(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomRow(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TopBadgesScreen()),
                            );
                          },
                          txt2: "Top Badges",
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shadowColor: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomCardWidget(),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCardWidget(),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCardWidget(),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCardWidget(),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCardWidget(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomRow(
                          onTap: () {},
                          txt2: "Oppertunity To Give",
                          //onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>to))},
                        ),
                      ),
                      OppertunitiesListTile(
                          txtt1: "Feed Seniores", txtt2: "Subtitle Goes Here"),
                      OppertunitiesListTile(
                          txtt1: "Feed Seniores", txtt2: "Subtitle Goes Here"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/img1.png'),
          radius: 30,
        ),
        Text("Name ")
      ],
    );
  }
}
