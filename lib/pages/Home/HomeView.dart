import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/utils/Toast/ToastUtil.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int limit = 10;
  bool isLoading = false;
  bool hasMore = true;
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
    // _loadBanners();
    // _loadCategory();
    // _loadSuggestion();
    // _loadInVogueList();
    // _loadOneStopList();
    // _loadRecommendList();
    _registEvent();
    Future.microtask((){
      _refreshKey.currentState!.show();
      // _scrollController.position.pixels = 20;
      //动画包裹
     
      // _scrollController.jumpTo(-80);
        _scrollController.animateTo(-80,
          duration: const Duration(milliseconds: 1000), curve: Curves.linearToEaseOut);
    });
  
  }

  // 滚动控制器
  void _registEvent() {
    _scrollController.addListener(() {
      //上拉加载更多数据
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
       
        limit += 10;
        _loadRecommendList();
        ToastUtil.show(context, "加载更多...");
      }
      //下拉刷新数据
      // if (_scrollController.position.pixels ==
      //     _scrollController.position.minScrollExtent) {
      //   print("滚动到了顶部");
      //   limit = 10;
      //   hasMore = true;
      //   _loadRecommendList();
      // }
    });
  }

  Future<void> _loadRecommendList() async {
    if (isLoading || !hasMore) {
      return;
    }
    isLoading = true;

    _recommendList = await homeApi.getRecommendList({"limit": limit});

    isLoading = false;
    print(_recommendList.length);
    if (_recommendList.length < limit) {
      hasMore = false;
    }
    setState(() {
      
    });
  
  }

  Future<void> _loadBanners() async {
    _banners = await homeApi.getBanners();
    
  }

  Future<void> _loadCategory() async {
    _categorys = await homeApi.getCategory();
    
  }

  Future<void> _loadSuggestion() async {
    _suggestionResult = await homeApi.getSuggestions();
    // print(_suggestionResult);
   
  }

  Future<void> _loadInVogueList() async {
    _inVogueResult = await homeApi.getInVogueList();
   
  }

  Future<void> _loadOneStopList() async {
    _oneStopResult = await homeApi.getOneStopList();
    
  }
  Future<void> _onRefresh() async{
    limit = 10;
    hasMore = true;
    isLoading = false;
    await _loadBanners();
    await _loadCategory();
    await _loadSuggestion();
    await _loadInVogueList();
    await _loadOneStopList();
    await _loadRecommendList();
    ToastUtil.show(context, "刷新成功");
     setState(() {
       
     });
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
              Expanded(
                child: HmHot(result: _inVogueResult, type: "inVogue"),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: HmHot(result: _oneStopResult, type: "oneStop"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10.0)),
      HmMoreList(recommendList: _recommendList),
    ];
  }

  final ScrollController _scrollController = ScrollController();
  //GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _onRefresh,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: _getSlivers(),
      ),
    );
  }

  // static homaApi() {}
}
