import 'dart:math';

import 'package:chatapp/Screen/oppertunities_screen/oppertunity_screen.dart';
import 'package:chatapp/Screen/recognization_screen/recognization_screen.dart';
import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:chatapp/Screen/widgets/SignUpButton.dart';
import 'package:chatapp/Screen/widgets/custometextfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubmitOpportunities extends StatefulWidget {
  const SubmitOpportunities({Key? key}) : super(key: key);

  @override
  State<SubmitOpportunities> createState() => _SubmitOpportunitiesState();
}

class _SubmitOpportunitiesState extends State<SubmitOpportunities> {
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
                  Container(
                    color: Color.fromRGBO(198, 0, 0, 1),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          "Submit Opportunities",
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //height: 50,
                    width: 350,
                    child: Column(
                      children: [
                        customTextField(
                          hinttext: "Feed Seniors",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customTextField(
                          hinttext: "Feed Seniors",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Discribe The Acts Of Kindness And Its Impacts"),
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "Up Tp 500 Characters",
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      children: [
                        TextWidget(HeadLinesText: "Select Date"),

                        //date feild here
                        TextWidget(HeadLinesText: "Address"),
                      ],
                    ),
                  ),
                  Container(
                    width: 350,
                    child: Column(
                      children: [
                        customTextField(
                          hinttext: "Address Line 1",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customTextField(
                          hinttext: "Address Line 2",
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       color: Colors.amber,
                        //       child: TextField(
                        //         decoration: InputDecoration(
                        //           border: OutlineInputBorder(),
                        //           labelText: 'User Name',
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        customTextField(hinttext: "Zip Code"),
                        SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                            HeadLinesText:
                                "List The Oppertunities Requirements"),
                        Container(
                          height: 45,
                          child: TextField(
                            onChanged: (value) {
                              userTappedSearch(value);
                            },
                            decoration: InputDecoration(
                              hintText: "Personal Vehicles",
                              suffixIcon: Container(
                                padding: const EdgeInsets.all(0),
                                decoration: new BoxDecoration(
                                  color: Color.fromRGBO(198, 0, 0, 1),
                                  borderRadius: new BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                                child: IconButton(
                                    icon: Icon(Icons.add),
                                    color: Colors.white,
                                    onPressed: () {}),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextWidget(HeadLinesText: "Great Opportunity for"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 45,
                          child: TextField(
                            onChanged: (value) {
                              userTappedSearch(value);
                            },
                            decoration: InputDecoration(
                              hintText: "Teenager And Payment",
                              suffixIcon: Container(
                                padding: const EdgeInsets.all(0),
                                decoration: new BoxDecoration(
                                  color: Color.fromRGBO(198, 0, 0, 1),
                                  borderRadius: new BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                                child: IconButton(
                                    icon: Icon(Icons.add),
                                    color: Colors.white,
                                    onPressed: () {}),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SignUpButton(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OppertunityScreen()),
                            );
                          },
                          title: "Submit Opportunity",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
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

  void userTappedSearch(String value) {}
}
