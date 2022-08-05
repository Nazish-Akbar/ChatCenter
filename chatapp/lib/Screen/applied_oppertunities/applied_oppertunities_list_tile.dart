import 'package:flutter/material.dart';

class AppliedOppertunitiesListTileWidget extends StatelessWidget {
  final String txtt1;
  final String txtt2;
  //final IconData Icons1;
  AppliedOppertunitiesListTileWidget({
    required this.txtt1,
    required this.txtt2,
    //required this.Icons1
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txtt1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(txtt2),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
