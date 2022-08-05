import 'package:chatapp/Screen/HomeScreen/HomeScreen.dart';
import 'package:chatapp/Screen/welcomescree/welcomescreen.dart';
import 'package:chatapp/Screen/widgets/SignUpButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../wrapper_screen/drawer_wrapper.dart';

class NominationScreen extends StatefulWidget {
  @override
  State<NominationScreen> createState() => _NominationScreenState();
}

class _NominationScreenState extends State<NominationScreen> {
  final controller = PageController();
  final title = [
    "Nominate A Giver",
    "Giver A Page Token",
    "Tell The Story",
    "Give An Applause",
    "Agape Badges",
    "Agape Gives Community",
    "View Oppertunity To Give"
  ];
  final messages = [
    "We want to congratulate the givers in the world and "
        "give them recognition for their good deeds. "
        "Nominate a giver to show the world their "
        "good deeds. ",
    "Give your nominee Agape tokens to show your "
        "appreciation for their acts of kindness. The Agape token is a token of appreciation to say thank you.",
    "Let the world know how great your nominee has been. Explain their acts of kindness, upload videos and images of the good deed or its results.",
    "Once your giver receives their Agape Tokens, they can receive an applause from all Agape members. Everyone wants to recognize a job well done.",
    "Agape Badges are given to members that give abundantly. Build up your Agape Tokens to achieve Lifetime Achivement Badges. ",
    "Interact the Agape Givers Community. You can applaud acts of kindness, add friends, and send kind messages. This community was built to show love.",
    "Are you looking for an opportunity to make a difference? We provide list of opportunities so you can assist organizations in your local community.",
  ];
  final images = [
    'assets/img1.png',
    'assets/img2.png',
    'assets/img3.png',
    'assets/img4.png',
    'assets/img5.png',
    'assets/img6.png',
    'assets/img7.png',
  ];

  int numberOfPages = 7;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: Color(0xffC60000),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 60,
                    child: Container(
                      child: SvgPicture.asset('assets/leadingGroup.svg'),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    child: Container(
                      child: SvgPicture.asset('assets/Ellipse 1.svg'),
                    ),
                  ),
                  Positioned(
                    right: 1,
                    top: 20,
                    child: Container(
                      child: SvgPicture.asset('assets/Ellipse 2.svg'),
                    ),
                  ),
                ],
              ),
            ),
            PageView.builder(
              controller: controller,
              onPageChanged: (Index) {
                setState(() {
                  currentPage = Index;
                });
              },
              itemCount: numberOfPages,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 7,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Indicator(
                        controller: controller,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        title[currentPage],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        messages[currentPage],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xff8C8A8A)),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: SignUpButton(
                        title: currentPage == numberOfPages - 1
                            ? 'Explore Agape'
                            : 'Continue',
                        onTap: () {
                          if (currentPage == numberOfPages - 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DrawerWrapper(),
                              ),
                            );
                          } else {
                            controller.jumpToPage(currentPage + 1);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}

class Indicator extends AnimatedWidget {
  final PageController controller;
  const Indicator({required this.controller}) : super(listenable: controller);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 15,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _createIndicator(index);
                })
          ],
        ),
      ),
    );
  }

  Widget _createIndicator(index) {
    double w = 10;
    double h = 10;
    MaterialColor color = Colors.grey;

    if (controller.page == index) {
      h = 13;
      w = 13;
    }

    return Container(
      margin: EdgeInsets.only(left: 4, right: 4),
      height: 9,
      width: 9,
      decoration: new BoxDecoration(
        color: controller.page == index ? Color(0xffC60000) : Color(0xffE3E3E3),
        shape: BoxShape.circle,
      ),
    );
  }
}
