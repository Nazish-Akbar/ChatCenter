import 'package:flutter/material.dart';

class HomeListView extends StatelessWidget {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  HomeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                width: MediaQuery.of(context).size.width * 0.10,
                child: Container(
                    child: Center(
                  child: Text(
                    numbers[index].toString(),
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                )),
              );
            }),
      ),
    );
  }
}
