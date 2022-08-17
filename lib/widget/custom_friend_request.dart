import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/database_services.dart';
import 'package:provider/provider.dart';

import '../screens/notification/notification_provider.dart';

class CustomFriendReques extends StatefulWidget {
  final title;
  final image1;
  final subtitle;
  final confirmOnpressd;
  const CustomFriendReques(
      {this.image1, this.title, this.subtitle, this.confirmOnpressd});

  @override
  State<CustomFriendReques> createState() => _CustomFriendRequesState();
}

class _CustomFriendRequesState extends State<CustomFriendReques> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
        builder: (context, model, child) => Card(
            margin: new EdgeInsets.only(bottom: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    // backgroundImage: NetworkImage(userProfileImage),
                    radius: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            widget.title,
                            style: TextStyle(
                              color: Color(0xff3E3E3E),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            widget.subtitle,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: FlatButton(
                                  onPressed: widget.confirmOnpressd,
                                  child: Text('Confirm',
                                      style: TextStyle(color: Colors.white)),
                                  color: Theme.of(context).primaryColor,
                                  splashColor: Color(0xffDCDDDF),
                                  textColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                              ),
                              Container(
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Text('Delete',
                                      style: TextStyle(color: Colors.black)),
                                  color: Color(0xffDCDDDF),
                                  splashColor: Color(0xffEBECF0),
                                  textColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceEvenly,
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      decoration: BoxDecoration(
                          //color: Colors.pink,
                          ),
                      height: 100,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )));
  }
}
