import 'package:chatapp/Screen/nominationscreen/nominationscreen.dart';
import 'package:chatapp/Screen/widgets/SignUpButton.dart';
import 'package:chatapp/Screen/widgets/custometextfeild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class LogInScree extends StatelessWidget {
  const LogInScree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/logo1.svg"),
                    SvgPicture.asset("assets/logo.svg")
                  ],
                ),
                height: 250,
                decoration: BoxDecoration(
                  // color: Color(0xffC60000),
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "LogIn",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      customTextField(
                        hinttext: "Email Id",
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Color(0xffC60000),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      customTextField(
                        hinttext: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xffC60000),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            color: Color(0xffC60000),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SignUpButton(
                  title: "LogIn",
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NominationScreen(),
                        ));
                  }),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    text: "Don't Have An Account?",
                    style: TextStyle(color: Colors.black54),
                    children: <TextSpan>[
                      TextSpan(
                        text: "    Sign Up",
                        style: TextStyle(
                            color: Color(0xffC60000),
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer(),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
