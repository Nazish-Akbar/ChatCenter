import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/enums/view_state.dart';
import 'package:flutter_application_1/core/models/base_view_model.dart';
import 'package:flutter_application_1/core/models/person_model.dart';
import 'package:flutter_application_1/core/models/friend_request.dart';
import 'package:flutter_application_1/core/services/database_services.dart';
import 'package:flutter_application_1/widget/custom_snackbar.dart';
import 'package:get/get.dart';

import '../../core/locator.dart';
import '../../core/models/app_user.dart';
import '../../core/services/auth_services.dart';

class FriendRequestProvider extends BaseViewModal {
  FriendRequestModel friendRequestModel = FriendRequestModel();
  DatabaseServices _databaseServices = DatabaseServices();
  List<AppUser> allAppUsers = [];
  List<AppUser> searchedUsers = [];
  bool isSearching = false;

  final appUser = AppUser();
  final locateUser = locator<AuthServices>();
  FriendRequestProvider() {
    getAppUsers();
  }

  getAppUsers() async {
    setState(ViewState.busy);
    allAppUsers = await _databaseServices.getAllAppUser();
    setState(ViewState.idle);
  }

  sendFriendRequest(int index, BuildContext context) async {
    setState(ViewState.busy);

//Test Case Data Generation//
    // FriendRequestModel x = FriendRequestModel(
    //   receiverId: locateUser.appUser.appUserId,
    //   senderDescription: null,
    //   senderId: locateUser.appUser.appUserId,
    //   senderImage: locateUser.appUser.imageUrl,
    //   senderName: locateUser.appUser.userName,
    // );
    FriendRequestModel x = FriendRequestModel(
      receiverId: allAppUsers[index].appUserId,
      senderDescription: null,
      senderId: locateUser.appUser.appUserId,
      senderImage: locateUser.appUser.imageUrl,
      senderName: locateUser.appUser.userName,
      sentAt: DateTime.now(),
    );

    final result = await _databaseServices.sendFriendRequest(x);
    if (result != true) {
      // customSnackBar(context, "Could not send Request");
      print("Friend Request could not be sent");
    }
    // customSnackBar(context, "Friend Request has been sent");
    // Get.snackbar(titleText: Text("asdf"), );
    print("Friend Request has been sent");
    setState(ViewState.idle);
  }

  searchUserByName(String keyword) {
    print("Searched keyword : $keyword");
    keyword.isEmpty ? isSearching = false : isSearching = true;
    searchedUsers = allAppUsers
        .where(
            (e) => (e.userName!.toLowerCase().contains(keyword.toLowerCase())))
        .toList();

    searchedUsers = allAppUsers
        .where(
            (e) => (e.userName!.toLowerCase().contains(keyword.toLowerCase())))
        .toList();

    notifyListeners();
  }
}





//   List<Persons> _friendRequests = [
//     // Person("title", subtile, image1),
//   ];

//   FriendRequestProvider() {
//     //get friend requests on first execution, inside constructor
//     getFriendRequests();
//   }

// //-- This is our function to get friend requests.//

//   getFriendRequests() async {
//     setState(ViewState.busy);
    

// // We are fetching the data from databse over here

//     _databaseServices.getFriendRequest(locateUser.appUser.appUserId!);

// // To convert the data into useful format

// //This is the end of function declartion, the funciton will end either in error message
// // or result in setting friend requests inside _persons list. Both way, screen status is
// // changed to idle, to let user know.

//     setState(ViewState.idle);
//   }
// }
