import 'package:flutter_application_1/core/models/base_view_model.dart';
import 'package:flutter_application_1/core/models/friend_model.dart';

import '../../core/enums/view_state.dart';
import '../../core/locator.dart';
import '../../core/models/app_user.dart';
import '../../core/services/auth_services.dart';
import '../../core/services/database_services.dart';

class NotificationProvider extends BaseViewModal {
  DatabaseServices _databaseServices = DatabaseServices();

  final appUser = AppUser();
  final locateUser = locator<AuthServices>();

  List<Persons> friendRequestsList = [];

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
      print("Number of Friend Requests = ${friendRequestsList.length}");
      print("${friendRequestsList[0]}");
    }
// To convert the data into useful format

//This is the end of function declartion, the funciton will end either in error message
// or result in setting friend requests inside _persons list. Both way, screen status is
// changed to idle, to let user know.

    setState(ViewState.idle);
  }
}
