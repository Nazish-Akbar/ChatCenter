import 'package:flutter/material.dart';

class RowSearchBars extends StatelessWidget {
  final onChanged;
  final hintText;
  IconData icon;

  RowSearchBars({this.onChanged, this.hintText, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 3),
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        color: Color(0xffC60000),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
