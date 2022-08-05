import 'package:chatapp/Screen/top_givers/friend_model.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:chatapp/Screen/widgets/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_friend.dart';
import '../widgets/d_w_m_tab.dart';

class FriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarWidget(
                txt: "Top Givers",
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabButton(),
                    DMWTabButton(),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 20),
                      child: RichText(
                        text: TextSpan(children: <InlineSpan>[
                          TextSpan(
                            text: ' Friends',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: SizedBox(width: 230)),
                          TextSpan(
                              text: 'see all ',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListView.builder(
                        itemCount: personList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 5),
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
            ],
          ),
        ),
      ),
    );
  }
}
