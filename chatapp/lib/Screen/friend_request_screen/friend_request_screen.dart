import 'package:chatapp/Screen/friend_request_screen/friend_model.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_friend_request.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC60000),
        title: Text(
          "Friend Requests",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SvgPicture.asset('assets/heart.svg'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            RichText(
                text: TextSpan(children: <InlineSpan>[
              TextSpan(
                text: ' Friend Request',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: SizedBox(width: 10)),
              TextSpan(
                text: ' 256',
                style: TextStyle(color: Color(0xffC60000), fontSize: 20),
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: SizedBox(width: 70)),
              TextSpan(
                  text: 'see all ',
                  style: TextStyle(color: Color(0xffC60000), fontSize: 18),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
            ])),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: personList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomFriendReques(
                    title: personList[index].title,
                    subtitle: personList[index].subtile,
                    image1: personList[index].image1,
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
