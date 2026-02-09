import 'package:flutter/material.dart';

class ToastUtil{
  static void show(BuildContext context,String msg,int durationT){
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        content: Text(msg,
        textAlign: TextAlign.center,),
        width: 120,
        duration:Duration(milliseconds: durationT) ,
        behavior: SnackBarBehavior.floating,),
    );
  }
}