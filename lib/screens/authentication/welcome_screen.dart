// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widget/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

import '../../widget/custom_avatar.dart';
import 'login/login_screen.dart';
import 'signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 260,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/Group3.svg",
                ),
                SizedBox(
                  height: 10,
                ),
                SvgPicture.asset(
                  "assets/Group2.svg",
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color(0xffC60000),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Text(
              "Congratulate those who do\n positive deeds",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Applaud, Explore & Share with your friends',
            style: TextStyle(color: Colors.grey, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAvatar(
                SvgPicture: SvgPicture.asset(
                  "assets/facebook.svg",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CustomAvatar(
                SvgPicture: SvgPicture.asset(
                  "assets/twitter.svg",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CustomAvatar(
                SvgPicture: SvgPicture.asset(
                  "assets/google.svg",
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              title: 'Log in',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              }),
          SizedBox(
            height: 10,
          ),
          CustomButton(
              title: 'Create Account',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
