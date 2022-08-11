import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../core/constants/style/style.dart';
import '../../core/enums/view_state.dart';
import '../../core/models/app_user.dart';
import '../../core/packages/audio_recording/audio_player.dart';
import '../../core/packages/audio_recording/audiorecordingscreen.dart';
import 'message_provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import "package:just_audio/just_audio.dart" as ap;

class ChatScreen extends StatelessWidget {
  final AppUser? toAppUser;

  ChatScreen({this.toAppUser});

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider(
        // create: (context)=>MessageProvider(),
        // child:
        Consumer<MessageProvider>(
      builder: (context, model, child) {
        return Scaffold(
          // backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: redColor,
            title: ListTile(
              onTap: () {
                //  Navigator.push(
                // context,
                // CustomPageRoute(
                //   child: OtherUserProfileScreen(
                //     user: toAppUser,
                //   ),
                //   ),
                // );
              },
              contentPadding: EdgeInsets.all(0),
              leading: toAppUser!.profileImage == null
                  ? CircleAvatar(
                      backgroundImage: AssetImage("assets/profile_icon.png"),
                    )
                  : CircleAvatar(
                      backgroundImage:
                          NetworkImage("${toAppUser!.profileImage}"),
                    ),
              title: Text(
                "${toAppUser!.userName}",
                // style: fontSize16.copyWith(
                //     fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            shape: appBarShape,
          ),

          ///
          /// body
          ///
          body: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///
                /// Messages
                ///
                model.userImage == null
                    ? StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("Conversations")
                            .doc(model.currentUser.appUser.appUserId)
                            .collection("Chats")
                            .doc(toAppUser!.appUserId!)
                            .collection("messages")
                            .orderBy('sentAt', descending: true)
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            // print(snapshot.data!.docs["messageText"]);
                            // return Text('message');

                            return Expanded(
                              child: ListView.builder(
                                  reverse: true,
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot doc =
                                        snapshot.data!.docs[index];

                                    // var getimg = doc["imageUrl"];
                                    var type = doc["type"];
                                    // print('print type' + type.toString());
                                    return Column(
                                      children: [
                                        type == 0
                                            ? Align(
                                                alignment: (doc["sender"] ==
                                                        model.currentUser
                                                            .appUser.appUserId
                                                    ? Alignment.topRight
                                                    : Alignment.topLeft),
                                                child: Container(
                                                    width: 200.0,
                                                    height: 200.0,
                                                    child: Image.network(
                                                        "${doc['imageUrl']}")),
                                              )
                                            : type == 1
                                                ? Align(
                                                    alignment: (doc["sender"] ==
                                                            model
                                                                .currentUser
                                                                .appUser
                                                                .appUserId
                                                        ? Alignment.topRight
                                                        : Alignment.topLeft),
                                                    child: Card(
                                                        elevation: 2,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: AudioPlayer(
                                                            audioFilePath:
                                                                model.audioPath,
                                                            source:
                                                                ap.AudioSource
                                                                    .uri(
                                                              Uri.parse(model
                                                                  .audioPath),
                                                            ),
                                                            onDelete: () {
                                                              model
                                                                  .clearAudioPath();
                                                            },
                                                            showDone: false,
                                                            showDeleteButton:
                                                                true,
                                                          ),
                                                        )))
                                                : Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                            vertical: 10),
                                                    child: Align(
                                                      alignment: (doc[
                                                                  "sender"] ==
                                                              model
                                                                  .currentUser
                                                                  .appUser
                                                                  .appUserId
                                                          ? Alignment.topRight
                                                          : Alignment.topLeft),
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 5),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: doc["sender"] ==
                                                                    model
                                                                        .currentUser
                                                                        .appUser
                                                                        .appUserId!
                                                                ? Colors.grey
                                                                    .withOpacity(
                                                                        0.3)
                                                                : Colors
                                                                    .blue[200]),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "${doc['messageText']}",
                                                            style: TextStyle(
                                                              color: doc["sender"] !=
                                                                      model
                                                                          .currentUser
                                                                          .appUser
                                                                          .appUserId!
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                      ],
                                    );
                                  }),
                            );
                          } else {
                            return Text("No Messages found");
                          }
                        },
                      )
                    : Image.file(
                        model.userImage!,
                        fit: BoxFit.cover,
                        height: 550,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),

                ///
                ///
                // Expanded(
                //   child: model.messages.isEmpty ? Center(child: Text('No Messages'),) : ListView.builder(
                //       reverse: true,
                //       itemCount: model.messages.length,
                //       itemBuilder: (context, index) {
                //         return Container(
                //           padding: EdgeInsets.symmetric(horizontal:15 ,vertical: 10),
                //           child: Align(
                //             alignment: (model.messages[index].sender == model.currentUser.appUser.appUserId ? Alignment.topRight : Alignment.topLeft),
                //             child: Container(
                //               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                //               decoration: textFiledContainerStyle.copyWith(color: model.messages[index].sender == model.currentUser.appUser.appUserId! ? primaryColor : Theme.of(context).backgroundColor),
                //               child: Text(
                //                 "${model.messages[index].messageText}",
                //                 style: TextStyle(
                //                   color: model.messages[index].sender != model.currentUser.appUser.appUserId! ? Theme.of(context).accentColor: Colors.white,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         );
                //       }),
                // ),
                ///
                /// send message
                ///
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  child: Row(
                    children: [
                      Form(
                        key: model.formKey,
                        child: Expanded(
                          child: TextFormField(
                              validator: (value) {
                                if (value != null || value!.isNotEmpty) {
                                  model.conversation.messageText = value;
                                } else if (value.isEmpty) {
                                  return '';
                                }
                              },
                              cursorColor: redColor,
                              controller: model.messageController,
                              decoration: InputDecoration(
                                hintText: "Message...",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {
                                        recordAudioFunction(
                                          context,
                                          model: model,
                                        );
                                      },
                                      child: Icon(
                                        Icons.keyboard_voice,
                                        color: redColor,
                                        size: 30,
                                      )),
                                ),
                                prefixIcon: GestureDetector(
                                  onTap: () {
                                    model.pickImageFromGallery(context);
                                    // print("Sent to User :${toAppUser!.appUserId}");
                                    // model.addUserMessages(toAppUser!.appUserId!,
                                    //     model.conversation, toAppUser!);
                                  },
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 30,
                                    color: redColor,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: redColor, shape: BoxShape.circle),
                          child: GestureDetector(
                            onTap: () {
                              print("Sent to User :${toAppUser!.appUserId}");
                              model.addUserMessages(
                                toAppUser!.appUserId!,
                                model.conversation,
                                toAppUser!,
                              );
                            },
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      //
                    ],
                  ),
                ),
                //         Container(
                //           padding: const EdgeInsets.all(15.0),
                // decoration: BoxDecoration(
                //     color: redColor, shape: BoxShape.circle),
                // child: InkWell(
                //   child: Icon(
                //     Icons.keyboard_voice,
                //     color: Colors.white,
                //         ))),
              ],
            ),
          ),
        );
      },
      // ),
    );
  }

  /// Record Audio Function to show Bottom Sheet//
  ///
  recordAudioFunction(
    BuildContext context, {
    // bool isSmall = false,
    required MessageProvider model,
  }) {
    // MessageProvider model = Provider.of<MessageProvider>(context);
    Get.bottomSheet(
      Container(
        height: Get.height * 0.4,
        child: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: !model.isAudioAttached
                    ? AudioRecordingScreen()
                    : AudioRecordingScreen(
                        audioFilePath: model.audioPath,
                        showPlayer: true,
                        audioSource: ap.AudioSource.uri(
                          Uri.parse(model.audioPath),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      barrierColor: Colors.black54,
      isDismissible: true,
      persistent: true,
      enableDrag: false,
    );
  }
}
