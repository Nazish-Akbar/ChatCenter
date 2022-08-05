import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/SignUpButton.dart';
import '../widgets/custom_appbar_widget.dart';

class IndividualOppertunities extends StatelessWidget {
  const IndividualOppertunities({Key? key}) : super(key: key);

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
                  "Individual Opportunities",
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Feed Seniors"),
                    Text("Glen Dale Fire Associations,Inc"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 400,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black54, width: 2.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Help distribute boxes of fruit and vegetables or canned goods to low income senior citizens at AHC's Charter House. an affordable housing apartment building located in Silver Spring. Boxes will be placed outside apartment doors to minimize contact with residents. Boxes weigh between 20-40 pounds so volunteers must be able to lift that amount. AHC follows best practices for volunteers during COVID 19 including wearing masks and practicing social distancing.",
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 385,
            width: 380,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  IndividualScreenContainer(
                    Icons: Icons.timelapse_rounded,
                    Txt1: "Duration",
                    Txt2:
                        "Thursday, December 17 from 1:30 pm - 2:30 pm\nMonday, December 21 from 12:30 - 1:30 pm\nMonday, January 11 from 12:30 - 1:30 pm",
                  ),
                  Container(
                    width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black54, width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IndividualScreenContainer(
                    Icons: Icons.location_on_outlined,
                    Txt1: "Location",
                    Txt2:
                        "AHC’s Charter House\n15896 Charter House Lane\nSilver Spring, Maryland, 20756",
                  ),
                  Container(
                    width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black54, width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IndividualScreenContainer(
                    Icons: Icons.pages_outlined,
                    Txt1: "Requirements",
                    Txt2:
                        "Personal Vehicle\nAble to lift 40+ pounds\nOrientation or Training",
                  ),
                  Container(
                    width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black54, width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IndividualScreenContainer(
                    Icons: Icons.card_giftcard_sharp,
                    Txt1: "Good For",
                    Txt2: "Teenager and Parent\nTeenager and Parent\nCouple",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SignUpButton(
            onTap: () {},
            title: 'I Want To Help You',
          ),
        ]),
      ),
    );
  }
}

class IndividualScreenContainer extends StatelessWidget {
  final String Txt1;
  final String Txt2;
  IconData Icons;
  IndividualScreenContainer(
      {required this.Txt1, required this.Txt2, required this.Icons});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons,
              color: Colors.red,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              Txt1,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          child: Column(
            children: [
              Text(
                Txt2,
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
