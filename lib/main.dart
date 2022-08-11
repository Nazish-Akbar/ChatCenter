import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/chat_screen.dart';
import 'package:flutter_application_1/screens/home/message_screen.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'core/locator.dart';
import 'screens/authentication/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/friend/friend_request_provider.dart';
import 'screens/home/message_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  await setupLocator();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MessageProvider>(
          create: (context) => MessageProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pregnancy Tracker',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
        ),
        home: ScreenUtilInit(
          //TODO: Screen sizes to be changed according to the design provided
          designSize: Size(width, height),
          //  builder: (_, child) => SplashScreen(),
          builder: (_, child) => SplashScreen(),
          // builder: (_, child) => SignUp(),
          //builder: (_, child) => PriceRangeScreen(),
        ),
      ),
    );
  }
}
