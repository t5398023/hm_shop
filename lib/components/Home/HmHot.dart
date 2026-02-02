import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  HmHot({Key? key}) : super(key: key);

  @override
  _HmHotState createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 150,
       color: Colors.red,
       alignment: Alignment.center,
       child: Text("热门商品",style: TextStyle(color: Colors.black),),
    );
  }
}