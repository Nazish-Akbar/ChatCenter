import 'package:flutter/material.dart';

import '../widgets/custom_appbar_widget.dart';
//Nomination

class NominationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              color: Color(0xffC60000),
              child: Column(
                children: [
                  CustomAppBarWidget(txt: "Nomination"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 320,
                    width: 500,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black54),
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
                              ],
                            ),
                          ],
                        ),
                        Text(
                            "Lloyd Was Too Helpfull Today By Talking to\nMy Mother ",
                            textAlign: TextAlign.start,
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 30, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 202, 202, 202),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //  height: 200,
                    width: 400,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text("Why Did You Give"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NominationScreenButtons(
                              BText: "Spontaneous",
                              color: Colors.blue,
                            ),
                            NominationScreenButtons(
                              BText: "Random",
                              color: Colors.purple,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NominationScreenButtons(
                              BText: "BountiFull",
                              color: Colors.orangeAccent,
                            ),
                            NominationScreenButtons(
                              BText: "Heart Of Gold",
                              color: Colors.deepOrange,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "The Spontaneous Givers Gives Based On Inner Impulse"),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 202, 202, 202),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Do You Accept This Nomination"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EButton(
                        Etext: "Yes",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      EButton(
                        Etext: "No",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//elevated custom Button
class EButton extends StatelessWidget {
  final String Etext;
  const EButton({required this.Etext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      width: 150,
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Color(0xffC60000); //<-- SEE HERE
              return null; // Defer to the widget's default.
            },
          ),
        ),
        child: Text(Etext),
      ),
    );
  }
}

// nomination button
class NominationScreenButtons extends StatelessWidget {
  final String BText;
  final color;
  const NominationScreenButtons({
    required this.BText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          onPressed: () {},
          child: Text(
            BText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
