import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_application_1/screens/authentication/welcome_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core/locator.dart';
import '../core/services/auth_services.dart';
import '../widget/bottom_navigation_bar.dart';



class SplashScreen extends StatefulWidget {
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _authService = locator<AuthServices>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreenDelay();
  }


  splashScreenDelay() async {
    ///
    /// splash screen delay
    ///
    await Future.delayed(Duration(seconds: 3));

    if (_authService.appUser.appUserId != null && _authService.isLogin!) {
      if (_authService.appUser.isFirstLogin ?? false) {
        Get.offAll(() => BottomNavigation(),
        );
      } else {
        Get.offAll(() => BottomNavigation());
        print('User id=> ${_authService.appUser.appUserId}');
        Future.delayed(Duration(seconds: 1));
        // Get.snackbar("Congrats", "message",snackStyle: SnackStyle.FLOATING,isDismissible: true);
      }
    } else if (_authService.appUser == null && !_authService.isLogin!) {
      Get.offAll(() => WelcomeScreen());
      print("App user name ${_authService.appUser.userName}");
      print("isLogin ${_authService.isLogin}");
    } else {
      Get.offAll(() => WelcomeScreen());
      print("User email ${_authService.appUser.userEmail}");
      print("isLogin ${_authService.isLogin}");
    }
    
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthScreen()));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       color: redColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: SvgPicture.asset(
                      "assets/heart.svg",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                      "Chat Center",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
    // :Text("You are not connected to the internet");
  }
}
