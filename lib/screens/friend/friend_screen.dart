import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/enums/view_state.dart';
import '../../core/models/person_model.dart';
import '../../widget/custom_friend.dart';
import '../home/message_provider.dart';
import 'friend_request_provider.dart';

class FriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FriendRequestProvider>(
      create: (context) => FriendRequestProvider(),
      child: Consumer<FriendRequestProvider>(builder: (context, model, child) {
        return ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: redColor,
              title: Text(
                "All User",
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
            ),
            body: buildAllUserScreen(model, context),
          ),
        );
      }),
    );
  }
}

buildAllUserScreen(FriendRequestProvider model, BuildContext context) {
  return model.allAppUsers.isEmpty
      ? Center(child: Text("No users found"))
      : Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Padding(padding: EdgeInsets.all(5));
            },
            padding: EdgeInsets.symmetric(vertical: 5),
            itemCount: model.isSearching == false
                ? model.allAppUsers.length
                : model.searchedUsers.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  model.isSearching == false
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.grey, width: 1),
                            ),
                            tileColor: Theme.of(context).cardColor,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            leading: model.allAppUsers[index].profileImage ==
                                    null
                                ? CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage:
                                        AssetImage('assets/profile_icon.png'),
                                  )
                                : CircleAvatar(
                                    radius: 30.r,
                                    // backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(
                                        '${model.allAppUsers[index].profileImage}'),
                                  ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(model.allAppUsers[index].userName!),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {
                                      model.sendFriendRequest(index, context);
                                    },
                                    child: Text('Send Request',
                                        style: TextStyle(color: Colors.white)),
                                    color: Theme.of(context).primaryColor,
                                    splashColor: Color(0xffDCDDDF),
                                    textColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            tileColor: Theme.of(context).cardColor,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            leading: model.searchedUsers[index].userName == null
                                ? CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage:
                                        AssetImage('assets/profile_icon.png'),
                                  )
                                : CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: NetworkImage(
                                        '${model.searchedUsers[index].profileImage}'),
                                  ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(model.searchedUsers[index].userName!),
                              ],
                            ),
                          ),
                        ),
                ],
              );
            },
          ),
        );
}


//       body: SingleChildScrollView(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: RichText(
//                     text: TextSpan(children: <InlineSpan>[
//                   TextSpan(
//                     text: ' Friends',
//                     style: TextStyle(
//                       color: Color(0xff3E3E3E),
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   WidgetSpan(
//                       alignment: PlaceholderAlignment.baseline,
//                       baseline: TextBaseline.alphabetic,
//                       child: SizedBox(width: 230)),
//                   TextSpan(
//                       text: 'see all ',
//                       style: TextStyle(color: Colors.blue, fontSize: 15),
//                       recognizer: TapGestureRecognizer()..onTap = () {}),
//                 ])),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: ListView.builder(
//                   itemCount: personList.length,
//                   shrinkWrap: true,
//                   padding: EdgeInsets.only(top: 16),
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return CustomFriend(
//                       title: personList[index].title,
//                       subtitle: personList[index].subtile,
//                       image1: personList[index].image1,
//                     );
//                   },
//                 ),
//               ),
//             ]),
//       ),
//     );
//   }
// }
