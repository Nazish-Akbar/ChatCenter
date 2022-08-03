import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/services/database_storage_services.dart';
import 'package:intl/intl.dart';

import '../../core/enums/view_state.dart';
import '../../core/locator.dart';
import '../../core/models/app_user.dart';
import '../../core/models/base_view_model.dart';
import '../../core/models/conversation_model.dart';
import '../../core/services/auth_services.dart';
import '../../core/services/database_services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MessageProvider extends BaseViewModal {
  XFile? image;
  File? userImage;
 
  final ImagePicker imagePicker = ImagePicker();
  bool isSearching = false;
  AppUser currentAppUser = AppUser();
  final formKey = GlobalKey<FormState>();
  List<AppUser> searchedUsers = [];
  List<AppUser> appUsers = [];
  List<AppUser> allAppUsers = [];

  List<AppUser> conversationUserList = [];
  List<AppUser> searchedAppUsers = [];
  DatabaseServices databaseServices = DatabaseServices();
  final currentUser = locator<AuthServices>();
  final Conversation conversation = Conversation();
  List<Conversation> messages = [];
  final messageController = TextEditingController();

  Stream<QuerySnapshot>? getMessageStream;
  Stream<QuerySnapshot>? getConversationListStream;
  var onlyTime = DateFormat.jm();
  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  final locateUser = locator<AuthServices>();

  MessageProvider() {
    currentAppUser = currentUser.appUser;
    getAppUsers();
    getUserConversationList();
  }

  ///
  /// Get all app users
  ///
  getAppUsers() async {
    setState(ViewState.busy);
    appUsers = await databaseServices.getAllAppUser();
    setState(ViewState.idle);
  }

  ///
  /// send message
  ///
  addUserMessages(
      String toUserId, Conversation conversation, AppUser toAppUser) async {
    if (formKey.currentState!.validate()) {

      //setState(ViewState.busy);
      conversation.sentAt = DateTime.now().toString();
      toAppUser.createdAt = DateTime.now();
      // toAppUser.createdAt = DateTime.now().toString();
      conversation.sender = currentUser.appUser.appUserId!;
      toAppUser.lastMessage = conversation.messageText;
      currentAppUser.createdAt = DateTime.now();
      currentAppUser.lastMessage = conversation.messageText;
      currentAppUser.lastMessageAt = DateTime.now().toString();
      // toAppUser.createdAt = DateTime.now().toString();
      messageController.clear();
  

      if (userImage!=null){
        var imageUrl = await databaseStorageServices.uploadMessagesImg(
          userImage!, locateUser.appUser.appUserId!);
          conversation.imageUrl=imageUrl;
          userImage = null;
          
          conversation.type=0;
        

      }else{
        userImage=null;

        conversation.type=1;
      
      }

        print("Is this will print two time or one?==================================");
      await databaseServices.addUserMessage(
          currentAppUser, toUserId, conversation, toAppUser);
      print(currentAppUser.lastMessage);
      userImage = null;
  
      notifyListeners();

    
    }
  }

  pickImageFromGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = File(image!.path);
      // print("UserImagePath=>${userImage!.path}");
    }
    notifyListeners();
  }


  // Audio Recording logic starts from here

  String? _audioPath;
  String? iOSAudioPath;
  bool isAudioAttached = false;
  String? voiceNoteUrl;
    File? voiceNote;

  setAudioPath(String audioPath) async {
    print("Old Audio File Path = ${this.audioPath}");
    print("isAudioAttached $isAudioAttached");
    this._audioPath = audioPath;
    print("New Audio File Path = $audioPath");
    isAudioAttached = true;
    // print(isAudioAttached);
    print("is Audio Attached = $isAudioAttached");

    if (Platform.isIOS) {
      iOSAudioPath = audioPath.replaceAll('file:///', '');
      // File file = File(iOSAudioPath!);
      voiceNote = File(iOSAudioPath!);
      print("file = $voiceNote");
      print("file Path = ${voiceNote!.path}");
      var x = await voiceNote!.exists();
      print("File Exists = $x");
      print("${await getFileSize(iOSAudioPath!, 2)}");
    } else {
      voiceNote = File(audioPath);
      print("file = $voiceNote");
      print("file Path = ${voiceNote!.path}");
      var x = await voiceNote!.exists();
      print("File Exists = $x");
      print("${await getFileSize(audioPath, 2)}");
    }

    // voiceData = await rootBundle.load(audioPath);

    // voiceNote = await File(audioPath).create();
    // voiceNote = File(audioPath);
    // notifyListeners();
    notifyListeners();
  }

  // var voiceData;

  get audioPath => this._audioPath;

  clearAudioPath() {
    isAudioAttached = false;
    _audioPath = null;
    voiceNote = null;
    notifyListeners();
  }

    getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }


  // ///
  // /// Get user messages using stream
  // ///
  // getAllMessages(String toUserId) async{
  //   print("ToUserId => $toUserId");
  //   setState(ViewState.busy);
  //   getMessageStream =  _databaseServices.getRealTimeChat(currentUser.appUser.appUserId!, toUserId);
  //   getMessageStream!.listen((event) {
  //     messages = [];
  //     if(event.docs.length > 0){
  //       event.docs.forEach((element) {
  //         messages.add(Conversation.formJson(element, element.id));
  //         notifyListeners();
  //         print('Message from stream');
  //         print('Messages length ${messages.length}');
  //       });
  //      notifyListeners();
  //     }
  //     else{
  //       messages = [];
  //       notifyListeners();
  //     }
  //   });
  //   // messages = await _databaseServices.getAllMessages(currentUser.appUser.appUserId!, toUserId);
  //   setState(ViewState.idle);
  // }
  ///
  /// Get conversation list
  ///
  getUserConversationList() async {
    setState(ViewState.busy);
    getConversationListStream =
        databaseServices.getUserConversationList(currentUser.appUser);
    getConversationListStream!.listen((event) {
      conversationUserList = [];
      if (event.docs.length > 0) {
        event.docs.forEach((element) {
          conversationUserList.add(AppUser.fromJson(element, element.id));
          notifyListeners();
        });
      }
    });
    setState(ViewState.idle);
  }

  ///
  /// convert appbar into searching mode
  ///
  searchingMode() {
    if (isSearching) {
      isSearching = false;
    } else {
      isSearching = true;
    }
    notifyListeners();
  }

  ///
  /// search user by name
  ///
  searchUserByName(String keyword) {
    print("Searched keyword : $keyword");
    keyword.isEmpty ? isSearching = false : isSearching = true;
    searchedUsers = conversationUserList
        .where(
            (e) => (e.userName!.toLowerCase().contains(keyword.toLowerCase())))
        .toList();

    searchedAppUsers = appUsers
        .where(
            (e) => (e.userName!.toLowerCase().contains(keyword.toLowerCase())))
        .toList();
    notifyListeners();
  }
}
