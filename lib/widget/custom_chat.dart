import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/chat/chat_screen.dart';

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList(
      {required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.isMessageRead});
      
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatScreen();
        }));},
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
        child: Card(
          // padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.imageUrl),
                        maxRadius: 30,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.name,
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                widget.messageText,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                    fontWeight: widget.isMessageRead
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                widget.time,
                style: TextStyle(
                  color: Colors.grey,
                    fontSize: 12,
                    fontWeight: widget.isMessageRead
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
