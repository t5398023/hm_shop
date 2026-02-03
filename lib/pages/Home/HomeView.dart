import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _banners = [];
  List<CategoryItem> _categorys = [];
  List<GoodDetailItem> _recommendList = [];
  SuggestionResult _suggestionResult = SuggestionResult(
    id: "",
    title: "",
    subTypes: [],
  );
  SuggestionResult _inVogueResult = SuggestionResult(
    id: "",
    title: "",
    subTypes: [],
  );
  SuggestionResult _oneStopResult = SuggestionResult(
    id: "",
    title: "",
    subTypes: [],
  );
  @override
  void initState() {
    super.initState();
    _loadBanners();
    _loadCategory();
    _loadSuggestion();
    _loadInVogueList();
    _loadOneStopList();
    _loadRecommendList();
  }

  Future<void> _loadRecommendList() async {
    _recommendList = await homeApi.getRecommendList({
     "limit": 10,
    });
    // print(_recommendList);
    if (mounted) setState(() {});
  }

  Future<void> _loadBanners() async {
    _banners = await homeApi.getBanners();
    if (mounted) setState(() {});
  }

  Future<void> _loadCategory() async {
    _categorys = await homeApi.getCategory();
    if (mounted) setState(() {});
  }

  Future<void> _loadSuggestion() async {
    _suggestionResult = await homeApi.getSuggestions();
    // print(_suggestionResult);
    if (mounted) setState(() {});
  }

  Future<void> _loadInVogueList() async {
    _inVogueResult = await homeApi.getInVogueList();
    if (mounted) setState(() {});
  }

  Future<void> _loadOneStopList() async {
    _oneStopResult = await homeApi.getOneStopList();
    if (mounted) setState(() {});
  }

  List<Widget> _getSlivers() {
    return [
      SliverToBoxAdapter(child: HmSlider(banners: _banners)),
      SliverToBoxAdapter(child: SizedBox(height: 10.0)),
      SliverToBoxAdapter(child: HmCategory(categorys: _categorys)),
      SliverToBoxAdapter(child: SizedBox(height: 10.0)),
      SliverToBoxAdapter(
        child: HmSuggestion(suggestionResult: _suggestionResult),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10.0)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot(result: _inVogueResult, type: "inVogue")),
              SizedBox(width: 10.0),
              Expanded(child: HmHot(result: _oneStopResult, type: "oneStop")),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10.0)),
      HmMoreList(recommendList: _recommendList),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getSlivers());
  }

  // static homaApi() {}
}
