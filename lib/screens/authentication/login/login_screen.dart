import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_application_1/widget/custom_button.dart';
import 'package:flutter_application_1/widget/custom_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../core/enums/view_state.dart';
import '../../../widget/bottom_navigation_bar.dart';
import '../../../widget/custom_container.dart';
import '../auth_provider.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child:
            Consumer<AuthenticationProvider>(builder: (context, model, child) {
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
                                'Login',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              CustomTextField(
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  model.appUser.userEmail = value;
                                },
                                prefixIcon: Icon(Icons.email),
                                hinttext: 'Email id',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  model.appUser.password = value;
                                },
                                prefixIcon: Icon(Icons.lock),
                                hinttext: "Pasword",
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 250),
                                child: Text(
                                  "Forgot pasword?",
                                  style: TextStyle(
                                      color: Color(0xffC60000), fontSize: 15),
                                ),
                              ),
                              SizedBox(height: 70),
                              CustomButton(
                                  title: 'Login',
                                  onPressed: () {
                                    model.loginUser(model.appUser, context);
                                    // Navigator.pushReplacement(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => BottomNavigation(),
                                    //   ),
                                    // );
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: ' Don\'t have account?',
                                    style:
                                        TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                  TextSpan(
                                      text: 'Sign Up ',
                                      style: TextStyle(
                                          color: Color(0xffC60000), fontSize: 15),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SignUpScreen(),
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
        }));
  }
}
