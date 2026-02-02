import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class HmCategory extends StatefulWidget {
  final List<CategoryItem> categorys;
  HmCategory({Key? key,required this.categorys}) : super(key: key);

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
        itemCount: widget.categorys.length,
        itemBuilder: (context,index){
          return Container(
            // height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 236, 236),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 80,
            height: 60,
            // color: Colors.red,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            // child: Text(widget.categorys[index].name,style:TextStyle(color:Colors.white,fontSize: 20.0)),
            child: Column(
              children: [
                Image.network(widget.categorys[index].picture ?? "",width:70,height: 70,),
                Text(widget.categorys[index].name,style:TextStyle(color:Colors.black,fontSize: 12.0)),
              ],
            ),
          );
        },
       ),
    );
  }
}