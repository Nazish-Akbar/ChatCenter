import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomFriend extends StatefulWidget {
  final title;
  final subtitle;
  final image1;
  const CustomFriend
({this.image1,this.title,this.subtitle}) ;

  @override
  State<CustomFriend> createState() => _CustomFriendState();
}

class _CustomFriendState extends State<CustomFriend> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {},
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
                     //   backgroundImage: NetworkImage(widget.imageUrl),
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
                                widget.title,
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xff3E3E3E)),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                widget.subtitle,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                   ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             
              
            ],
          ),
        ),
      ),
    );
  }
}