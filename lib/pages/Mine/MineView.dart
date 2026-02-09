import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Mine/HmGuess.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class MineView extends StatefulWidget {
  const MineView({super.key});

  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  List<GoodDetailItem> _recommendList = [];
   @override
   void initState() { 
     super.initState();
     _loadRecommendList();
   }

  Future<void> _loadRecommendList() async {
    // if (isLoading || !hasMore) {
    //   return;
    // }
    // isLoading = true;

    _recommendList = await homeApi.getRecommendList({"limit": 30});

    // isLoading = false;
    print(_recommendList.length);
    // if (_recommendList.length < limit) {
    //   hasMore = false;
    // }
    setState(() {
      
    });
  
  }
  Widget _buildHeader() {
    return Container(
      height: 100.0,
      color: const Color.fromARGB(255, 245, 232, 232),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0),
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Image(image: AssetImage("lib/assets/Login/unloginIcon.png")),
            //AssetImage("lib/assets/Home/limit_time.png")
          ),
          SizedBox(width: 10.0),
          Text(
            "用户",
            style: TextStyle(
              color: const Color.fromARGB(255, 35, 35, 35),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVipCar() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      height: 48.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 220, 171, 112),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage("lib/assets/Login/selStore.png"),
                width: 20.0,
                height: 20.0,
              ),
              SizedBox(width: 10.0),
              Text(
                "会员中心",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          //长为 60 高为 40 的文字按钮，显示立即开通
          Container(
            margin: EdgeInsets.only(left: 10.0),
            width: 80.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                "立即开通",
                style: TextStyle(
                  color: const Color.fromARGB(255, 220, 171, 112),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // IconButton(onPressed: onPressed, icon: icon)
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      //创建一个横向分布的餐单，上面为图标，下面为文字，依次是我的收藏、我的足迹、我的客服
      height: 100.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      // height: 48.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 235, 235),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //   image: AssetImage("lib/assets/Login/selStore.png"),
              //   width: 20.0,
              //   height: 20.0,
              // ),
              Icon(
                Icons.favorite_rounded,
                color: const Color.fromARGB(255, 223, 102, 102),
              ),
              SizedBox(height: 10.0),
              Text(
                "我的收藏",
                style: TextStyle(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //   image: AssetImage("lib/assets/Login/selStore.png"),
              //   width: 20.0,
              //   height: 20.0,
              // ),
              Icon(
                Icons.history_rounded,
                color: const Color.fromARGB(255, 183, 127, 127),
              ),
              SizedBox(height: 10.0),
              Text(
                "我的足迹",
                style: TextStyle(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //   image: AssetImage("lib/assets/Login/selStore.png"),
              //   width: 20.0,
              //   height: 20.0,
              // ),
              Icon(
                Icons.chat_rounded,
                color: const Color.fromARGB(255, 203, 118, 118),
              ),
              SizedBox(height: 10.0),
              Text(
                "我的客服",
                style: TextStyle(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderMenu() {
    return Container(
      //创建一个横向分布的餐单，上面为图标，下面为文字，依次是待付款、待发货、待收货、待评价
      height: 100.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      // height: 48.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0,top: 10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 235, 235),
        borderRadius: BorderRadius.circular(8.0),
          
        
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              Icon(
                Icons.all_inbox_rounded,
                color: const Color.fromARGB(255, 223, 102, 102),
              ),
              SizedBox(height: 10.0),
              Text(
                "全部订单",
                style: TextStyle(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              Icon(
                Icons.payment_rounded,
                color: const Color.fromARGB(255, 223, 102, 102),
              ),
              SizedBox(height: 10.0),
              Text(
                "待付款",
                style: TextStyle(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Icon(
                Icons.local_shipping_rounded,
                color: const Color.fromARGB(255, 183, 127, 127),
              ),
              SizedBox(height: 10.0),
              Text(
                "待发货",
                style: TextStyle(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Icon(
                Icons.local_shipping_rounded,
                color: const Color.fromARGB(255, 203, 118, 118),
              ),
              SizedBox(height: 10.0),
              Text(
                "待收货",
                style: TextStyle(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Icon(
                Icons.star_border_rounded,
                color: const Color.fromARGB(255, 203, 118, 118),
              ),
              SizedBox(height: 10.0),
              Text(
                "待评价",
                style: TextStyle(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildHeader()),
        SliverToBoxAdapter(child: _buildVipCar()),
        SliverToBoxAdapter(child: _buildMenu()),
        SliverToBoxAdapter(child: _buildOrderMenu()),
        //pinned: true, 固定头部，不滚动消失
        SliverPersistentHeader(delegate: HmGuess(), pinned: true),

        HmMoreList(recommendList: _recommendList),
      ],
    );
  }
}
