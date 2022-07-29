import 'package:flutter/cupertino.dart';

import 'chat_messages.dart';

class ChatUsers{
  String name;
  String messageText;
  String image;
  String time;
  ChatUsers({required this.name,required this.messageText,required this.image,required this.time});
}

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", image: "", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", image: "", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", image: "", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", image: "", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", image: ".", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", image: "", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", image: "", time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", image: "", time: "18 Feb"),
  ];
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  

  