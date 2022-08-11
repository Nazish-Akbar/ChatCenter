import 'package:chatapp/Screen/HomeScreen/HomeScreen.dart';
import 'package:chatapp/Screen/Notific_screen/notific_screen.dart';
import 'package:chatapp/Screen/chat_inbox_screen/model1.dart';
import 'package:chatapp/Screen/profile_screen/profile_screen.dart';
import 'package:chatapp/Screen/top_givers/top_givers.dart';
import 'package:flutter/material.dart';

import '../friends_screen/friends_screen.dart';
import '../messages_screen/messages_screen.dart';
import '../nomination_list_screen/nomination_list_screen.dart';
import '../nominator_screen.dart/nominator_screen.dart';
import '../oppertunities_screen/oppertunity_screen.dart';
import '../submit_opportunities/submit_opportunities.dart';
import '../top_badges/top_badges_screen.dart';
import '../user_profile/user_profile_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3133e),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 80,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/img6.png'),
                          radius: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Name Here",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SideDrawerRow(
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                icons: Icons.home,
                txts: "Home",
              ),
              SideDrawerRow(
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(),
                    ),
                  );
                },
                icons: Icons.person,
                txts: "Profile",
              ),
              SideDrawerRow(
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NomminatorScreen(),
                    ),
                  );
                },
                icons: Icons.person_remove,
                txts: "Nominate",
              ),
              SideDrawerRow(
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Friends_Screen(),
                    ),
                  );
                },
                icons: Icons.person_add_alt,
                txts: "Friends",
              ),
              SideDrawerRow(
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopBadgesScreen(),
                    ),
                  );
                },
                icons: Icons.badge,
                txts: "Badges",
              ),
              SideDrawerRow(
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessagesScreen(),
                    ),
                  );
                },
                icons: Icons.message,
                txts: "Message",
              ),
              SideDrawerRow(
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificScreen(),
                    ),
                  );
                },
                icons: Icons.notifications,
                txts: "Notifications",
              ),
              SideDrawerRow(
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubmitOpportunities(),
                    ),
                  );
                },
                icons: Icons.lightbulb,
                txts: "Opportunities",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 130),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Settings",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "LogOut",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SideDrawerRow extends StatelessWidget {
  final String txts;
  IconData icons;
  final ontap;
  SideDrawerRow({
    required this.txts,
    required this.icons,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Row(
            children: [
              Icon(
                icons,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                txts,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
