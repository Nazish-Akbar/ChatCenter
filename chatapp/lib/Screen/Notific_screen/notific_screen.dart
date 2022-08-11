import 'dart:math';

import 'package:chatapp/Screen/recognization_screen/recognization_screen.dart';
import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificScreen extends StatefulWidget {
  const NotificScreen({Key? key}) : super(key: key);

  @override
  State<NotificScreen> createState() => _NotificScreenState();
}

class _NotificScreenState extends State<NotificScreen> {
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
              child: Column(children: [
                Container(
                  color: Color.fromRGBO(198, 0, 0, 1),
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
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
                          child: SvgPicture.asset(
                            "assets/leadingicon.svg",
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          "Notification",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //
                //Align(alignment: Alignment.topLeft, child: Text("Today")),
                TextWidget(HeadLinesText: "Today"),
                NotificScreenCard(
                  T1: "David Warner commented on your  ",
                  T2: "token.",
                ),
                NotificScreenCard(
                  T1: "Jane Smith applauded your token. ",
                  T2: "16 min ago",
                ),
                Card2(
                  Tx1: "Sansa applauded",
                  Tx2: "20 min ago",
                ),
                //Align(alignment: Alignment.topLeft, child: Text("Yesterday")),
                TextWidget(HeadLinesText: "Yesterday"),
                Card2(
                  Tx1: "Sansa applauded",
                  Tx2: "20 min ago",
                ),
                NotificScreenCard(
                  T1: "Sansa kane applauded your token. ",
                  T2: "20 min ago",
                ),
                NotificScreenCard(
                  T1: "Sansa kane applauded your token. ",
                  T2: "20 min ago",
                ),
                Card2(
                  Tx1: "Sansa applauded",
                  Tx2: "20 min ago",
                ),
                //Align(alignment: Alignment.topLeft, child: Text("This Week")),
                TextWidget(HeadLinesText: "This Week"),
                NotificScreenCard(
                  T1: "Sansa kane applauded your token. ",
                  T2: "20 min ago",
                ),
                NotificScreenCard(
                  T1: "Sansa kane applauded your token. ",
                  T2: "20 min ago",
                ),
                Card2(
                  Tx1: "Sansa applauded",
                  Tx2: "20 min ago",
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}

class Card2 extends StatelessWidget {
  final String Tx1;
  final String Tx2;
  Card2({
    required this.Tx1,
    required this.Tx2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/img4.png"),
              radius: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Tx1),
                Text(Tx2),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              height: 25,
              width: 85,
              color: Color(0xffC60000),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Accept",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("Cancel"),
            )
          ],
        ),
      ),
    );
  }
}

class NotificScreenCard extends StatelessWidget {
  final String T1;
  final String T2;
  NotificScreenCard({
    required this.T1,
    required this.T2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/img7.png'),
              radius: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(T1),
                Text(T2),
              ],
            )
          ],
        ),
      ),
    );
  }
}
