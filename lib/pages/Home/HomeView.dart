import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
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
List<BannerItem> _banners = [];
@override
void initState() { 
  super.initState();
  _loadBanners();
}
 _loadBanners() async {
  _banners = await homeApi.getBanners();
  if (mounted) setState(() {});
}

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
  
  // static homaApi() {}
}