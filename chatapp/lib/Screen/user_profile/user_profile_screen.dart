import 'package:chatapp/Screen/recognization_screen/recognization_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../HomeScreen/home_screen_provider.dart';
import '../widgets/comment_section_button.dart';

//user profile screen
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Color.fromRGBO(198, 0, 0, 1),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
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
                  "Profile",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  width: 50,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    //width: ,
                    child: Image.asset(
                      'assets/img1.png',
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 50,
                    child: CircleAvatar(),
                  ),
                ],
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      TextWidget(HeadLinesText: "18"),
                      Text("Followers"),
                    ],
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
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                  Text("Lloyd Was Too Helpfull Today By Talking to\nMy Mother ",
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
    );
  }
}
