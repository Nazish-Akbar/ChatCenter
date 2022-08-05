import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

import '../HomeScreen/home_screen_provider.dart';
import '../widgets/comment_section_button.dart';
import '../widgets/tab_button.dart';

class ActOfKindnessScreen extends StatelessWidget {
  const ActOfKindnessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 110,
            color: Color(0xffC60000),
            child: CustomAppBarWidget(
              txt: "Act Of Kindness",
            ),
          ),
          Column(children: [
            TabButton(),
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
                            backgroundImage: AssetImage('assets/img6.png'),
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
                          backgroundImage: AssetImage('assets/img6.png'),
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
    );
  }
}
