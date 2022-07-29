import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_application_1/screens/chat/chat_screen.dart';
import 'package:flutter_application_1/screens/notification/notification_screen.dart';
import 'package:flutter_application_1/screens/profile/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/friend/friend_screen.dart';
import '../screens/home/conversation_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;

  final pages = [
    ConversationScreen(),
    NotificationScreen(),
    FriendScreen(),
    ProfileScreen(),
  ];

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: redColor,
                  // Background color
                ),
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: redColor,
                  // Background color
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        // backgroundColor: pageIndex == 0 ? Colors.white : blackColor,
        body: pages[pageIndex],
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomNavigationItems(
                getColor: pageIndex == 0 ? redColor : Colors.white,
                iconPath: 'assets/chat.svg',
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
              ),
               BottomNavigationItems(
                getColor: pageIndex == 1 ? redColor : Colors.white,
                iconPath: 'assets/notification.svg',
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
              ),
              BottomNavigationItems(
                getColor: pageIndex == 2 ? redColor : Colors.white,
                iconPath: 'assets/friend.svg',
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
              ),
              BottomNavigationItems(
                getColor: pageIndex == 3 ? redColor : Colors.white,
                iconPath: 'assets/user.svg',
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationItems extends StatelessWidget {
  final iconPath;
  final onPressed;
  final getColor;

  BottomNavigationItems({
    this.iconPath,
    this.onPressed,
    this.getColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: getColor,
            height: 30,
          ),
        ],
      ),
    );
  }
}
