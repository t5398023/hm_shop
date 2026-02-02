import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  HmCategory({Key? key}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
       child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context,index){
          return Container(
            // height: 50,
            
            width: 80,
            height: 100,
            color: Colors.red,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            child: Text("Cate $index",style:TextStyle(color:Colors.white,fontSize: 20.0)),
          );
        },
       ),
    );
  }
}