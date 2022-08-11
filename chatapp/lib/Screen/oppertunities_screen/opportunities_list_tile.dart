import 'package:chatapp/Screen/individual_opportunities/individual_opportunities.dart';
import 'package:flutter/material.dart';

class OppertunitiesListTile extends StatelessWidget {
  final String txtt1;
  final String txtt2;
  //final IconData Icons1;
  OppertunitiesListTile({
    required this.txtt1,
    required this.txtt2,
    //required this.Icons1
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => IndividualOppertunities()),
        );
      },
      child: Card(
        child: ListTile(
          // leading: CircleAvatar(),
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
              Text("This Miles"),
            ],
          ),
        ),
      ),
    );
  }
}
