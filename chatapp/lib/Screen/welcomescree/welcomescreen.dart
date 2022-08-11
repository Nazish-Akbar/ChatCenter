// ignore_for_file: prefer_const_constructors

import 'package:chatapp/Screen/loginscreen/loginscreen.dart';
import 'package:chatapp/Screen/widgets/socilaicons.dart';
import 'package:chatapp/Screen/widgets/SignUpButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

import '../signupscreen/signupscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 360,
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
                  SocialIcons(
                    SvgPicture: SvgPicture.asset(
                      "assets/facebook.svg",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SocialIcons(
                    SvgPicture: SvgPicture.asset(
                      "assets/twitter.svg",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SocialIcons(
                    SvgPicture: SvgPicture.asset(
                      "assets/google.svg",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SignUpButton(
                  title: "Log In",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInScree(),
                      ),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              SignUpButton(
                  title: "Create Account",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => signupScreen(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
