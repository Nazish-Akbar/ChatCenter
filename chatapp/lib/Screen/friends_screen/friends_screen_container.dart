import 'package:flutter/material.dart';

class container extends StatelessWidget {
  final String title1;
  final String title2;

  container({required this.title1, required this.title2});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Container(
          // height: 10,
          //width: 60,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/img3.png'),
                radius: 35,
                // backgroundColor: Color(0xffC60000),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 10),
                child: Column(
                  children: [
                    Text(
                      title1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      title2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
