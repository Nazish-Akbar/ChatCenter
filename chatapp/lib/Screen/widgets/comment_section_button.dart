import 'package:flutter/material.dart';

class CommentButtons extends StatelessWidget {
  final String txt;
  const CommentButtons({
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            Icons.share,
            color: Colors.black45,
          ),
          Text(
            txt,
            style: TextStyle(color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
