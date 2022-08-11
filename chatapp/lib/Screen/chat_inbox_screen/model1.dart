import 'package:flutter/cupertino.dart';

import 'model2.dart';

class ChatUsers {
  String name;
  String messageText;
  String image;
  String time;
  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.image,
      required this.time});
}

List<ChatUsers> chatUsers = [
  ChatUsers(
      name: "Jane Russel",
      messageText: "Awesome Setup",
      image: "images/userImage1.jpeg",
      time: "Now"),
  ChatUsers(
      name: "Glady's Murphy",
      messageText: "That's Great",
      image: "images/userImage2.jpeg",
      time: "Yesterday"),
  ChatUsers(
      name: "Jorge Henry",
      messageText: "Hey where are you?",
      image: "images/userImage3.jpeg",
      time: "31 Mar"),
  ChatUsers(
      name: "Philip Fox",
      messageText: "Busy! Call me in 20 mins",
      image: "images/userImage4.jpeg",
      time: "28 Mar"),
  ChatUsers(
      name: "Debra Hawkins",
      messageText: "Thankyou, It's awesome",
      image: "images/userImage5.jpeg",
      time: "23 Mar"),
  ChatUsers(
      name: "Jacob Pena",
      messageText: "will update you in evening",
      image: "images/userImage6.jpeg",
      time: "17 Mar"),
  ChatUsers(
      name: "Andrey Jones",
      messageText: "Can you please share the file?",
      image: "images/userImage7.jpeg",
      time: "24 Feb"),
  ChatUsers(
      name: "John Wick",
      messageText: "How are you?",
      image: "images/userImage8.jpeg",
      time: "18 Feb"),
];
List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
];
