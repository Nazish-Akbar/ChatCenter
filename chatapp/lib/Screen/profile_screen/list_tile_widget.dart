import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String txt1;
  final String txt2;
  final IconData Icons1;
  const ListTileWidget(
      {required this.txt1, required this.txt2, required this.Icons1});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons1),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(txt1),
            Text(txt2),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_right),
            )

            //Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }
}
