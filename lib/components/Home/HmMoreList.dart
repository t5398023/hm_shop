import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class HmMoreList extends StatefulWidget {
  final List<GoodDetailItem> recommendList;
  const HmMoreList({super.key,required this.recommendList});  

  @override
  _HmMoreListState createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context,index){
        return Container(
          height: 600,
          margin: EdgeInsets.all(10),
          // color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            // margin: EdgeInsets.all(10),
            children: [
              Image.network(widget.recommendList[index].picture),
              Text(widget.recommendList[index].name,style: TextStyle(color: Colors.black),maxLines: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("¥${widget.recommendList[index].price}",style: TextStyle(color: Colors.red),),
                      //添加划线
                      // 将价格乘以 1.2，然后向下取整
                      // (widget.recommendList[index].price * 1.2).floor()
                      // String discountPrice = (widget.recommendList[index].price * 1.2).floor();
                      Text("${widget.recommendList[index].price}",style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough,fontSize: 12),)
                    ],
                  ),
                  Text("${widget.recommendList[index].payCount}人付款",style: TextStyle(color: Colors.grey),)
                ],
              )
            ],
          ),
        );
      },
      itemCount: widget.recommendList.length,
    );
  }
}