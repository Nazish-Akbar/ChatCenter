import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/models/base_view_model.dart';
import 'package:flutter_application_1/core/models/person_model.dart';

import '../../core/enums/view_state.dart';
import '../../core/locator.dart';
import '../../core/models/app_user.dart';
import '../../core/models/friend_request.dart';
import '../../core/models/friends model.dart';
import '../../core/services/auth_services.dart';
import '../../core/services/database_services.dart';

class NotificationProvider extends BaseViewModal {
  DatabaseServices _databaseServices = DatabaseServices();

  final appUser = AppUser();
  final locateUser = locator<AuthServices>();
  List<AppUser> allAppUsers = [];
  List<Persons> friendRequestsList = [];

  List<Persons> myUser = [];

  Persons personModel = Persons();

  NotificationProvider() {
    print("NotificationProvider Constructor Called");
    getFriendRequests();
  }

  getFriendRequests() async {
    setState(ViewState.busy);

// We are fetching the data from databse over here

    var result =
        await _databaseServices.getFriendRequest(locateUser.appUser.appUserId!);
    // if (!result) {
    //   //show error snackbar to user
    // }
    print("Resulting documents are: ${result[0].data()}");

    for (int i = 0; i < result.length; i++) {
      friendRequestsList
          .add(Persons.fromJson(result[i], result[i]["senderId"]));
      myUser.add(friendRequestsList[i]);
      print("Number of Friend Requests = ${friendRequestsList.length}");
      print("${friendRequestsList[0]}");
    }
// To convert the data into useful format

//This is the end of function declartion, the funciton will end either in error message
// or result in setting friend requests inside _persons list. Both way, screen status is
// changed to idle, to let user know.

    setState(ViewState.idle);
  }

  confirmFun(int index, BuildContext context) async {
    setState(ViewState.busy);

    FriendsModel myModel = FriendsModel(
      receiverId: locateUser.appUser.appUserId,
      // senderDescription: null,
      senderId: friendRequestsList[index].senderId,
      friendImage: friendRequestsList[index].senderImage,
      friendName: friendRequestsList[index].senderName,
      //sentAt: DateTime.now(),
    );

    final result = await _databaseServices.addFriend(myModel);
    if (result != true) {
      // customSnackBar(context, "Could not send Request");
      print("Friend Request could not be sent");
    }
    // customSnackBar(context, "Friend Request has been sent");
    // Get.snackbar(titleText: Text("asdf"), );
    print("Friend Request has been sent");
    setState(ViewState.idle);
  }

//--- Confirn req

}
