import 'package:flutter/material.dart';

import '../chat_inbox_screen/chat_inbox_screen.dart';

class MessageListTile extends StatelessWidget {
  final String txtt1;
  final String txtt2;
  //final IconData Icons1;
  MessageListTile({
    required this.txtt1,
    required this.txtt2,
    //required this.Icons1
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xffC60000),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txtt1,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black45),
              ),
              Text(txtt2),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Time Here"),
            ],
          ),
        ),
      ),
    );
  }
}
