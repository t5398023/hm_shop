import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 final List<BannerItem> _banners = [
    BannerItem(id: "1", imgUrl: "https://kkimgs.yisou.com/ims?kt=url&at=ori&key=aHR0cDovL2Rlc2stZmQuem9sLWltZy5jb20uY24vdF9zOTYweDYwMGM1L2c1L00wMC8wMS8wRi9DaE1rSjFiS3d3MklGQ1c0QUFYbHZpX29RTW9BQUxHeEFMaW5KZ0FCZVhXOTYxLmpwZw==&sign=yx:cjgeIvVCExcONVnSFeGCjNfW7Do=&tv=0_0"),
    BannerItem(id: "2", imgUrl: "https://kkimgs.yisou.com/ims?kt=url&at=ori&key=aHR0cDovL3R2YTEuc2luYWltZy5jbi9sYXJnZS8wMDVOV01ha2d5MWdsanhtZndyeGxqMzFoYzB1MGF5ei5qcGc=&sign=yx:RjJIDQb_duvJDUL2YpnhiYZ8zCU=&tv=0_0"),
    BannerItem(id: "3", imgUrl: "https://kkimgs.yisou.com/ims?kt=url&at=ori&key=aHR0cDovL2ltZzE3LjNsaWFuLmNvbS9kL2ZpbGUvMjAxNzAyLzE4L2U3NjgwYmUwMmJjNjhhZGRjYmFmZjhhNzliOTA1ZjE4LmpwZw==&sign=yx:aYgRiONiQT8J10OPlD_hsm8ZBr8=&tv=0_0"),
  ];
  List<Widget> _getSlivers(){
    return [
      SliverToBoxAdapter(
        child: HmSlider(banners:_banners),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10.0,),
      ),
      SliverToBoxAdapter(
        child: HmCategory(),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10.0,),
      ),
      SliverToBoxAdapter(
        child: HmSuggestion(),
      ),
       SliverToBoxAdapter(
        child: SizedBox(height: 10.0,),
      ),
      SliverToBoxAdapter(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Flex(direction: Axis.horizontal,
        children: [
          Expanded(child: HmHot()),
          SizedBox(width: 10.0,),
          Expanded(child: HmHot()),
        ],)
        ),
      ),
        SliverToBoxAdapter(
        child: SizedBox(height: 10.0,),
      ),
      HmMoreList(),

    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getSlivers(),

    );
  }
}