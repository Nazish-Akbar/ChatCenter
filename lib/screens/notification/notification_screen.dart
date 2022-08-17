import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_application_1/screens/notification/notification_provider.dart';
import 'package:flutter_application_1/widget/custom_friend_request.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/models/person_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffC60000),
          title: Text(
            "Friend Requests",
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
          child: Column(children: [
            RichText(
                text: TextSpan(children: <InlineSpan>[
              TextSpan(
                text: ' Friend Request',
                style: TextStyle(
                  color: Color(0xff3E3E3E),
                  fontSize: 30,
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
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
            ])),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: model.friendRequestsList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomFriendReques(
                    confirmOnpressd: () {
                      model.confirmFun(index, context);
                      print('button is pressed');
                    },
                    title: model.friendRequestsList[index].senderName,
                    subtitle:
                        model.friendRequestsList[index].senderDescription ??
                            "No Description",
                    image1: model.friendRequestsList[index].senderImage,
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
