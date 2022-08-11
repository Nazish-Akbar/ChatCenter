import 'package:chatapp/Screen/widgets/SignUpButton.dart';
import 'package:chatapp/Screen/widgets/custometextfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signupScreen extends StatelessWidget {
  const signupScreen({Key? key}) : super(key: key);

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
                        "Sign Up",
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
                        prefixIcon: Icon(Icons.mail),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      customTextField(
                        hinttext: "Enter Your Full Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      customTextField(
                        hinttext: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      customTextField(
                        hinttext: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
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
              SignUpButton(title: "LogIn", onTap: () {}),
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
