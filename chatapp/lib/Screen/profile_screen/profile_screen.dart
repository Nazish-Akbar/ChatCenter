import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_appbar_widget.dart';
import 'list_tile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Column(children: [
          CustomAppBarWidget(
            txt: "Home",
          ),
          SizedBox(
            height: 20,
          ),
          DottedBorder(
            color: Color(0xffC60000),
            radius: Radius.circular(100),
            borderType: BorderType.RRect,
            strokeWidth: 2,
            dashPattern: [10, 6],
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                radius: 60,
                child: SvgPicture.asset(
                  "assets/picimg.svg",
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Jorge Weston"),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_disabled_sharp),
              Text("Weston"),
            ],
          ),
        ]),
        ListTileWidget(
          txt1: "Account",
          txt2: "Change Your Name, Phone Number etc",
          Icons1: Icons.person,
        ),
        ListTileWidget(
          txt1: "Security",
          txt2: "Edit Password, Two Factor Verification",
          Icons1: Icons.security,
        ),
        ListTileWidget(
          txt1: "Activity",
          txt2: "Show Member Activity On The AgapeApp",
          Icons1: Icons.local_activity,
        ),
        ListTileWidget(
          txt1: "Help",
          txt2: "Technical Support",
          Icons1: Icons.help,
        ),
      ]),
    );
  }
}

// class CustomAppBarWidget extends StatelessWidget {
//   const CustomAppBarWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       color: Color(0xffC60000),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 "assets/leadingicon.svg",
//                 height: 35,
//                 width: 35,
//               ),
//               SizedBox(
//                 width: 100,
//               ),
//               Text(
//                 "Home",
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               SizedBox(
//                 width: 110,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.menu,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           SearchBar(),
//         ],
//       ),
//     );
//   }
// }
