import 'dart:math';

import 'package:chatapp/Screen/side_drawer/side_drawer.dart';
import 'package:chatapp/Screen/widgets/SignUpButton.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custometextfeild.dart';
import '../widgets/tab_button.dart';
import 'img_picker.dart';
import 'package:dotted_border/dotted_border.dart';
//nominate a giver screen

class NomminatorScreen extends StatefulWidget {
  const NomminatorScreen({Key? key}) : super(key: key);

  @override
  State<NomminatorScreen> createState() => _NomminatorScreenState();
}

class _NomminatorScreenState extends State<NomminatorScreen> {
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
          color: Colors.red,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 243, 243, 243),
            body: SingleChildScrollView(
              child: Column(children: [
                Column(children: [
                  Container(
                    height: 120,
                    color: Color(0xffC60000),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomAppBarWidget(
                        txt: "Nominate A Giver",
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
                  ),
                  Container(
                      height: 70, color: Colors.white, child: TabButton()),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      customTextField(
                        hinttext: "Enter Your Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      customTextField(
                        hinttext: "Enter Your Email Id",
                        prefixIcon: Icon(Icons.mail),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(width: 1),
                            ),
                            width: 330,
                            child: Column(
                              children: [
                                Text(
                                    "Discribe The Acts Of Kindness And Its Impacts"),
                                SizedBox(
                                  height: 80,
                                ),
                                Text(
                                  "Up Tp 500 Characters",
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          DottedBorder(
                            color: Color(0xffC60000),
                            radius: Radius.circular(20),
                            strokeWidth: 2,
                            dashPattern: [10, 6],
                            child: Container(
                              height: 150,
                              width: 330,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 253, 227, 227),
                                // boxShadow: [
                                //   BoxShadow(color: Colors.blueAccent),
                                //]
                              ),
                              padding: EdgeInsets.all(40.0),
                              child: AppImagePicker(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SignUpButton(
                              title: "Submit Nomination", onTap: () {}),
                        ],
                      ),
                    ]),
                  ),
                ]),
              ]),
            )),
      ),
    ]);
  }
}
