import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/enums/view_state.dart';
import '../../../widget/bottom_navigation_bar.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_container.dart';
import '../../../widget/custom_textfield.dart';
import '../auth_provider.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkBoxNode = FocusNode();

    return ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(builder: (context, model, child) {
        return Scaffold(
          body: ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(
              color: redColor,
            ),
            inAsyncCall: model.state == ViewState.busy,
            child: SingleChildScrollView(
              child: Form(
                key: model.formKey,
                child: Column(
                  children: [
                    CustomContainer(),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Color(0xffF5F7F9)
                          // Colors.amber
                
                          ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email id can't be empty";
                                }
                              },
                              onChanged: (value) {
                                model.appUser.userEmail = value;
                              },
                              prefixIcon: Icon(Icons.email),
                              hinttext: 'Email id',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                             CustomTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Phone Number can't be empty";
                                }
                              },
                              onChanged: (value) {
                                model.appUser.phoneNumber = value;
                              },
                              prefixIcon: Icon(Icons.phone),
                              hinttext: 'Phone Number',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Name can't be empty";
                                }
                              },
                              onChanged: (value) {
                                model.appUser.userName = value;
                              },
                              prefixIcon: Icon(Icons.person),
                              hinttext: "Enter your name",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return "password must not be less than 6 character";
                                }
                              },
                              onChanged: (value) {
                                model.appUser.password = value;
                              },
                              prefixIcon: Icon(Icons.lock),
                              hinttext: "Pasword",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                model.appUser.confirmPassword = value;
                              },
                              prefixIcon: Icon(Icons.lock),
                              hinttext: "Confirm Pasword",
                            ),
                            SizedBox(height: 20),
                            CustomButton(
                                title: 'Sign Up',
                                onPressed: () {
                                  model.signUpUser(model.appUser, context);
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Already have an account?',
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 15),
                                ),
                                TextSpan(
                                    text: 'Login ',
                                    style: TextStyle(
                                        color: Color(0xffC60000), fontSize: 15),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ),
                                        );
                                      }),
                              ])),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
