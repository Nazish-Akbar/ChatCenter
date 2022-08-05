import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final hinttext;
  final prefixIcon;

  final onChanged;
  final validator;
  final controller;
  final sufFixIcon;
  final textInputAction;
  final keyBoardType;
  final maxLine;

  customTextField(
      {this.hinttext,
      this.prefixIcon,
      this.onChanged,
      this.validator,
      this.controller,
      this.sufFixIcon,
      this.keyBoardType,
      this.textInputAction,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      // margin: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        textInputAction: textInputAction,
        keyboardType: keyBoardType,
        controller: controller,
        // maxLines: maxLine,
        // minLines: ,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          hintText: hinttext,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC60000), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff999999), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          prefixIcon: prefixIcon,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff999999), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}