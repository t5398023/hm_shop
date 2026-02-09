import 'package:flutter/material.dart';

class HmGuess extends SliverPersistentHeaderDelegate {
  HmGuess();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      // height: 100.0,
      alignment: Alignment.center,
      color: Colors.white,
      child: Text("猜你喜欢",style: TextStyle(fontSize: 17.0),),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate){
    return false;
  }
}