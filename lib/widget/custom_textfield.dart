import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final hinttext;
  final onChanged;
  final validator;
  final controller;
  final prefixIcon;
  final sufFixIcon;
  final textInputAction;
  final keyBoardType;
  final maxLine;
  CustomTextField({
    this.controller,
    this.onChanged,
    this.validator,
    this.hinttext,
    this.prefixIcon,
    this.sufFixIcon,
    this.keyBoardType,
    this.textInputAction,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: TextFormField(
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          textInputAction: textInputAction,
          keyboardType: keyBoardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.sp)),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 15.w),
            hintText: hinttext,
          ),
        ),
      ),
    );
  }
}
