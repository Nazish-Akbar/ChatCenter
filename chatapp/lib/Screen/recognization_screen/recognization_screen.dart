import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecognizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              color: Color(0xffC60000),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
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
                          width: 100,
                        ),
                        Text(
                          "Recognization",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          width: 70,
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextWidget(
              HeadLinesText: "Latest Acheivments",
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                latestacheivementsrow(
                  svgImg: "assets/level1.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level2.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level3.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level4.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level5.svg",
                  Rtext: "Level 1",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextWidget(
              HeadLinesText: "Token Awards",
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                latestacheivementsrow(
                  svgImg: "assets/level1.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level2.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level3.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level4.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/heartofgold.svg",
                  Rtext: "Level 1",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Circle(
                  InText: "01",
                  OutText: "Level 1",
                ),
                Circle(
                  InText: "02",
                  OutText: "Level 2",
                ),
                Circle(
                  InText: "0",
                  OutText: "Level 3",
                ),
                Circle(
                  InText: "0",
                  OutText: "Level 4",
                ),
                Circle(
                  InText: "0",
                  OutText: "Level 5",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Circle(
                  InText: "0",
                  OutText: "Level 1",
                ),
                Circle(
                  InText: "0",
                  OutText: "Level 2",
                ),
                Circle(
                  InText: "0",
                  OutText: "Level 3",
                ),
                Circle(
                  InText: "0",
                  OutText: "Level 4",
                ),
                Circle(
                  InText: "0",
                  OutText: "Level 5",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextWidget(
              HeadLinesText: "Top Badges",
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                latestacheivementsrow(
                  svgImg: "assets/level1.svg",
                  Rtext: "Spontaneous",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level1.svg",
                  Rtext: "Random",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level1.svg",
                  Rtext: "Bountifull",
                ),
                latestacheivementsrow(
                  svgImg: "assets/heartofgold.svg",
                  Rtext: "Heart Of Gold",
                ),
                latestacheivementsrow(
                  svgImg: "assets/level1.svg",
                  Rtext: "Life Time",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                latestacheivementsrow(
                  svgImg: "assets/hexay11.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/hexa0.svg",
                  Rtext: "Level 2",
                ),
                latestacheivementsrow(
                  svgImg: "assets/hexa0.svg",
                  Rtext: "Level 3",
                ),
                latestacheivementsrow(
                  svgImg: "assets/hexa0.svg",
                  Rtext: "Level 4",
                ),
                latestacheivementsrow(
                  svgImg: "assets/hexa0.svg",
                  Rtext: "Level 5",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                latestacheivementsrow(
                  svgImg: "assets/hexa11.svg",
                  Rtext: "Level 1",
                ),
                latestacheivementsrow(
                  svgImg: "assets/hexa0.svg",
                  Rtext: "Level 2",
                ),
                latestacheivementsrow(
                  svgImg: "assets/hexa0.svg",
                  Rtext: "Level 3",
                ),
                latestacheivementsrow(
                  svgImg: "assets/hexa0.svg",
                  Rtext: "Level 4",
                ),
                latestacheivementsrow(
                  svgImg: "assets/hexa0.svg",
                  Rtext: "Level 5",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String HeadLinesText;
  TextWidget({
    required this.HeadLinesText,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          HeadLinesText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final String InText;
  final String OutText;
  const Circle({
    required this.InText,
    required this.OutText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blueGrey,
          ),
          height: 60,
          width: 60,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              InText,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(OutText),
      ],
    );
  }
}

class latestacheivementsrow extends StatelessWidget {
  final String Rtext;
  final svgImg;
  latestacheivementsrow({required this.Rtext, required this.svgImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            svgImg,
            height: 70,
            width: 70,
          ),
          Text(Rtext),
        ],
      ),
    );
  }
}
