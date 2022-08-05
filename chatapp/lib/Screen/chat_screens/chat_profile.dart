import 'package:flutter/material.dart';

import '../chat_inbox_screen/chat_inbox_screen.dart';

class ChatProfile extends StatelessWidget {
  const ChatProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.0, left: 8, bottom: 6),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(),
                            ));
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/icons/lion.jpg'),
                        maxRadius: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Name Of The User",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
