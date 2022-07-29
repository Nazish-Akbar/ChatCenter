import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../widget/icon_text.dart';
import '../authentication/welcome_screen.dart';
import 'edit_profile.dart';
import 'profile_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Consumer<ProfileProvider>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffC60000),
            title: Text(
              "Profile",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: SvgPicture.asset('assets/heart.svg'),
              ),
            ),
            actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                      }, 
                      child: Icon(Icons.edit)),
                ),
              ],
          ),
          
          body: Container(
            //   decoration: gradients,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  DottedBorder(
                    padding: EdgeInsets.all(5),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(100),
                    color: Color(0xffC60000),
                    strokeWidth: 2,
                    dashPattern: [10, 6],
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        backgroundImage: model.appUser.profileImage != null
                            ? NetworkImage("${model.appUser.profileImage}")
                            : AssetImage('assets/images/pregnant_img.png')
                                as ImageProvider,
                        radius: 70,
                        child: Text(''),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          model.appUser.userName == null
                              ? 'Theresa Khan'
                              : model.appUser.userName.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          model.appUser.description == null
                              ? 'Your Text Second Lines Goes Here'
                              : model.appUser.description.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        icon_texts(
                            icon: Icons.call,
                            txt1: 'Phone Number',
                            txt2: model.appUser.phoneNumber == null
                                ? '+xx 000 00000'
                                : model.appUser.phoneNumber.toString()),
                        SizedBox(
                          height: 15,
                        ),
                        // icon_texts(
                        //   icon: Icons.location_city,
                        //   txt1: 'Location',
                        //   txt2: model.appUser.userLocation == null
                        //       ? 'US'
                        //       : model.appUser.userLocation.toString(),
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        icon_texts(
                          icon: Icons.mail,
                          txt1: 'Email Address',
                          txt2: model.appUser.userEmail == null
                              ? 'EmailAddress@gmail.com'
                              : model.appUser.userEmail.toString(),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        icon_texts(
                          icon: Icons.lock,
                          txt1: 'Password',
                          txt2: '**********',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        icon_texts(
                          icon: Icons.privacy_tip_rounded,
                          txt1: 'Privacy Policy',
                          txt2: "",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        icon_texts(
                          onPressed: () async {
                            await model.locateUser.logoutUser();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()));
                          },
                          icon: Icons.logout,
                          txt1: 'LogOut',
                          txt2: '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );

    // ),
  }
}
