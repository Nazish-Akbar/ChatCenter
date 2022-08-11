import 'dart:math';

import 'package:chatapp/Screen/creating_opportunities/creating_opportunities.dart';
import 'package:chatapp/Screen/submitted_acts/submitted_acts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import '../side_drawer/side_drawer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_appbar_widget.dart';
import 'list_tile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(children: [
                  Column(children: [
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(0xffC60000),
                      ),
                      child: CustomAppBarWidget(
                        txt: "Setting",
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
                      height: 20,
                    ),
                    DottedBorder(
                      color: Color(0xffC60000),
                      radius: Radius.circular(100),
                      borderType: BorderType.RRect,
                      strokeWidth: 2,
                      dashPattern: [10, 6],
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 60,
                          child: SvgPicture.asset(
                            "assets/picimg.svg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Jorge Weston"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_disabled_sharp),
                        Text("Weston"),
                      ],
                    ),
                  ]),
                  ListTileWidget(
                    txt1: "Account",
                    txt2: "Change Your Name, Phone Number etc",
                    Icons1: Icons.person,
                  ),
                  ListTileWidget(
                    txt1: "Security",
                    txt2: "Edit Password, Two Factor Verification",
                    Icons1: Icons.security,
                  ),
                  ListTileWidget(
                    txt1: "Activity",
                    txt2: "Show Member Activity On The AgapeApp",
                    Icons1: Icons.local_activity,
                  ),
                  ListTileWidget(
                    txt1: "Help",
                    txt2: "Technical Support",
                    Icons1: Icons.help,
                  ),
                  InkWell(
                    onTap: (() => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatingOpportunities()),
                        )),
                    child: ListTileWidget(
                      txt1: "Create Opportunities",
                      txt2: "Technical Support",
                      Icons1: Icons.help,
                    ),
                  ),
                  InkWell(
                    onTap: (() => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubmittedActs(),
                          ),
                        )),
                    child: ListTileWidget(
                      txt1: "Submitted Acts",
                      txt2: "Technical Support",
                      Icons1: Icons.help,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
