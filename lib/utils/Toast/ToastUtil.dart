import 'package:flutter/material.dart';

class ToastUtil{
  static void show(BuildContext context,String msg){
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        content: Text(msg,
        textAlign: TextAlign.center,),
        width: 120,
        behavior: SnackBarBehavior.floating,),
    );
  }
}