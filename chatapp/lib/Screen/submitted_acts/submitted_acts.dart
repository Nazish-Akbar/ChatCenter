import 'dart:ui';

import 'package:chatapp/Screen/HomeScreen/home_screen_provider.dart';
import 'package:chatapp/Screen/oppertunities_screen/opportunities_list_tile.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/comment_section_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_row.dart';
import '../widgets/tab_button.dart';

class SubmittedActs extends StatelessWidget {
  const SubmittedActs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarWidget(txt: "Submitted Acts"),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(child: Text("Pending"), onPressed: () {}),
                      RaisedButton(child: Text("Approved"), onPressed: () {}),
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

                  //    TabButton(),

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
                            ],
                          ),
                          Text(
                              "Lloyd Was Too Helpfull Today By Talking to\nMy Mother ",
                              style: TextStyle(color: Colors.black45)),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Write Paragraph Here,Write ParagraphHere Write Paragraph Here,\nWrite Paragraph HereWrite Paragraph Here Write Paragraph Here\nWrite Paragraph HereWrite Paragraph Here Write Paragraph Here"),
                          ),
                          // Container(
                          //   height: 210,
                          //   width: 370,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(30),
                          //     image: DecorationImage(
                          //       image: AssetImage(
                          //         'assets/img6.png',
                          //       ),
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
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
    );
  }
}
