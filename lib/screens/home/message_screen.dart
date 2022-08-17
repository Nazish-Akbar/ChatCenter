import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_application_1/widget/searchbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/style/style.dart';
import '../../core/enums/view_state.dart';
import '../../widget/bottom_navigation_bar.dart';
import '../../widget/custom_route.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'message_provider.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(builder: (context, model, child) {
      return ModalProgressHUD(
        inAsyncCall: model.state == ViewState.busy,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            ///
            /// AppBar
            ///
            appBar: AppBar(
              bottom: TabBar(
                labelPadding: EdgeInsets.all(10),
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                tabs: [
                  Text("Messages"),
                  Text("All Friends"),
                ],
              ),
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: TextFormField(
                  decoration: searchFieldStyle.copyWith(
                    fillColor: Theme.of(context).cardColor,
                  ),
                  onChanged: (value) {
                    model.searchUserByName(value);
                  },
                ),
              ),
              centerTitle: true,
              shape: appBarShape,
              backgroundColor: redColor,
              // actions: [
              //   IconButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context, CustomPageRoute(child: AllUsersScreen()));
              //     },
              //     icon: Icon(Icons.open_in_new_rounded, color: Colors.white,),
              //   )
              // ],
            ),

            ///
            /// Body
            ///
            body: TabBarView(
              children: [
                buildMessagesScreen(model, context),
                buildFriendsScreen(model, context),
              ],
            ),
          ),
        ),
      );
    });
  }

  buildMessagesScreen(MessageProvider model, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        model.conversationUserList.isEmpty
            ? Center(
                child: Text("No Conversation found"),
              )
            : Expanded(
                child: ListView.separated(
                  itemCount: model.isSearching == false
                      ? model.conversationUserList.length
                      : model.searchedUsers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.grey, width: 1),
                        ),

                        trailing: Text(
                            "${model.onlyTime.format(model.conversationUserList[index].createdAt!)}"),

                        ///
                        /// User image
                        ///
                        leading: model.isSearching
                            ? model.searchedUsers[index].profileImage == null
                                ? CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: AssetImage(
                                        'assets/icons/profile_icon.png'),
                                  )
                                : CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: NetworkImage(
                                        '${model.searchedUsers[index].profileImage}'),
                                  )
                            : model.conversationUserList[index].profileImage ==
                                    null
                                ? CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage:
                                        AssetImage('assets/profile_icon.png'),
                                  )
                                : CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: NetworkImage(
                                        '${model.conversationUserList[index].profileImage}'),
                                  ),

                        ///
                        /// User name
                        ///
                        title: Text(
                            "${model.isSearching ? model.searchedUsers[index].userName : model.conversationUserList[index].userName}"),
                        subtitle: Text(
                          "${model.conversationUserList[index].lastMessage}",
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () async {
                          print(model.conversationUserList[index].appUserId);
                          // await model.getAllMessages(model.conversationUserList[index].appUserId!);
                          Navigator.push(
                              context,
                              CustomPageRoute(
                                  child: ChatScreen(
                                toAppUser: model.conversationUserList[index],
                              )));
                        },
                        tileColor: Theme.of(context).cardColor,
                        // contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(padding: EdgeInsets.all(5));
                  },
                ),
              )
      ],
    );
  }

  ///
  /// All app users
  ///
  buildFriendsScreen(MessageProvider model, BuildContext context) {
    return model.friendsList.isEmpty
        ? Center(child: Text("No users found"))
        : ListView.separated(
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.0),
                child: Divider(
                  thickness: 1,
                  color: redColor,
                ),
              );
            },
            padding: EdgeInsets.symmetric(vertical: 5),
            itemCount: model.isSearching == false
                ? model.friendsList.length
                : model.searchedAppUsers.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  model.isSearching == false
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            tileColor: Theme.of(context).cardColor,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            onTap: () async {
                              print(model.friendsList[index].senderId);
                              // await model.getAllMessages(model.appUsers[index].appUserId!);
                              Navigator.push(
                                  context,
                                  CustomPageRoute(
                                      child: ChatScreen(
                                          //    toAppUser: model.friendsList[index],
                                          )));
                            },
                            leading:
                                model.friendsList[index].friendImage == null
                                    ? CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: AssetImage(
                                            'assets/icons/profile_icon.png'),
                                      )
                                    : CircleAvatar(
                                        radius: 30.r,
                                        // backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(
                                            '${model.friendsList[index].friendImage}'),
                                      ),
                            title: Text(model.friendsList[index].friendName!),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            tileColor: Theme.of(context).cardColor,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            onTap: () async {
                              // await model.getAllMessages(model.searchedUsers[index].appUserId!);
                              Navigator.push(
                                  context,
                                  CustomPageRoute(
                                      child: ChatScreen(
                                          //   toAppUser: model.searchedAppUsers[index],
                                          )));
                            },
                            leading:
                                model.searchedAppUsers[index].friendName == null
                                    ? CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: AssetImage(
                                            'assets/icons/profile_icon.png'),
                                      )
                                    : CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: NetworkImage(
                                            '${model.searchedAppUsers[index].friendImage}'),
                                      ),
                            title:
                                Text(model.searchedAppUsers[index].friendName!),
                          ),
                        ),
                ],
              );
            },
          );
  }
}
