import 'dart:developer';
import 'dart:math';

import 'package:chatapp/Screen/creating_opportunities/creating_opportunity_container.dart';
import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class CreatingOpportunities extends StatefulWidget {
  @override
  State<CreatingOpportunities> createState() => _CreatingOpportunitiesState();
}

class _CreatingOpportunitiesState extends State<CreatingOpportunities> {
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
                      width: 500,
                      color: Color(0xffC60000),
                      child: CustomAppBarWidget(
                        txt: "Creating Opportunities",
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
                    ExpansionTile(
                      title: ETile(
                        Etxt1: "High Momnetum",
                        Etxt2: "Feed Seniors",
                        Etxt3: "No.Of Applicants.37",
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            child: COContainer(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpansionTile(
                      title: ETile(
                        Etxt1: "Mission Oxygen",
                        Etxt2: "Domestic Violence",
                        Etxt3: "No.Of Applicants.37",
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(child: COContainer()),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpansionTile(
                      title: ETile(
                        Etxt1: "ACT Grants",
                        Etxt2: "With Change A  ...",
                        Etxt3: "No.Of Applicants.37",
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(child: COContainer()),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpansionTile(
                      title: ETile(
                        Etxt1: "Khalsa Add",
                        Etxt2: "With DoorWays For",
                        Etxt3: "No.Of Applicants.15",
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(child: COContainer()),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpansionTile(
                      title: ETile(
                        Etxt1: "Foundation",
                        Etxt2: "What To Do..?",
                        Etxt3: "No.Of Applicants.37",
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(child: COContainer()),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpansionTile(
                      title: ETile(
                        Etxt1: "High Momnetum",
                        Etxt2: "Feed Seniors",
                        Etxt3: "No.Of Applicants.37",
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(child: COContainer()),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpansionTile(
                      title: ETile(
                        Etxt1: "Foundation",
                        Etxt2: "What To Do..?",
                        Etxt3: "No.Of Applicants.37",
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(child: COContainer()),
                        )
                      ],
                    )
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

class ETile extends StatelessWidget {
  final String Etxt1;
  final String Etxt2;
  final String Etxt3;
  const ETile({
    required this.Etxt1,
    required this.Etxt2,
    required this.Etxt3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img1.png"),
              fit: BoxFit.cover,
            ),
            // color: Color(0xffC60000),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Etxt1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              Etxt2,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              Etxt3,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20),
          child: FlatButton(
            onPressed: () {},
            child: Container(
                height: 25,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(
                    0xffC60000,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Remainig',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
