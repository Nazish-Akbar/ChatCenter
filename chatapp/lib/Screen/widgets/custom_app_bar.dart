import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final onChanged;
  final hintText;

  SearchBar({this.onChanged, this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 40,
      width: 400,
      decoration: BoxDecoration(
          color: Color(0xffC60000),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white)),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
