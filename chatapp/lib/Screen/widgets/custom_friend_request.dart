import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomFriendReques extends StatefulWidget {
  final title;
  final image1;
  final subtitle;
  const CustomFriendReques({this.image1, this.title, this.subtitle});

  @override
  State<CustomFriendReques> createState() => _CustomFriendRequesState();
}

class _CustomFriendRequesState extends State<CustomFriendReques> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: new EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              //backgroundColor: Color(0xffC60000),
              backgroundImage: AssetImage('assets/img7.png'),
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
                        color: Colors.black,
                        fontSize: 18,
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
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Confirm',
                                style: TextStyle(color: Colors.white)),
                            color: Color(0xffC60000),
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                        ),
                        Expanded(
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }
}
