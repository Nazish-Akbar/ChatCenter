import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/models/friend_model.dart';
import '../../widget/custom_friend.dart';

class FriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC60000),
        title: Text(
          "Friends",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RichText(
                      text: TextSpan(children: <InlineSpan>[
                    TextSpan(
                      text: ' Friends',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: SizedBox(width: 230)),
                    TextSpan(
                        text: 'see all ',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ])),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: personList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomFriend(
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
