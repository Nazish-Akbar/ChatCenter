import 'package:chatapp/Screen/nomination_list_screen/nomination_list_screen.dart';
import 'package:chatapp/Screen/welcomescree/welcomescreen.dart';
import 'package:flutter/material.dart';

import 'Screen/Notification_Screen/Notification_Screen.dart';
import 'Screen/act_of_kindness/act_of_kindness_screen.dart';
import 'Screen/creating_opportunities/creating_opportunities.dart';
import 'Screen/individual_opportunities/individual_opportunities.dart';
import 'Screen/recognization_screen/recognization_screen.dart';
import 'Screen/submit_opportunities/submit_opportunities.dart';
import 'Screen/user_profile/user_profile_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: WelcomeScreen(),
      // home: CreatingOpportunities(),
    );
  }
}
