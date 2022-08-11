import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

customSnackBar(BuildContext context, String message,
    {Duration? duration, SnackBarAction? action}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: 20.h,
        left: 20.w,
        right: 20.w,
      ),
      // width: ,
      action: action,
      duration: duration ?? Duration(seconds: 4),
      content: SafeArea(
        child: Text('$message'),
      ),
    ),
  );
}
