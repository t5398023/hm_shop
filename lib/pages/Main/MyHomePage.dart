import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/CartView.dart';
import 'package:hm_shop/pages/Category/CategoryView.dart';
import 'package:hm_shop/pages/Home/HomeView.dart';
import 'package:hm_shop/pages/Mine/MineView.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  //定义数据 根据数据进行渲染 4 个导航
  final List<Map<String,String>> _tabList = [{
    "icon":"lib/assets/Tabbar/unTabBtn0.png",//正常
    "active_icon":"lib/assets/Tabbar/TabBtn0.png",//选中
    "text":"首页"
      },{
    "icon":"lib/assets/Tabbar/unTabBtn1.png",//正常
    "active_icon":"lib/assets/Tabbar/TabBtn1.png",//选中
    "text":"分类"
      },{
    "icon":"lib/assets/Tabbar/unTabBtn2.png",//正常
    "active_icon":"lib/assets/Tabbar/TabBtn2.png",//选中
    "text":"购物车"
      },{
    "icon":"lib/assets/Tabbar/unTabBtn3.png",//正常
    "active_icon":"lib/assets/Tabbar/TabBtn3.png",//选中
    "text":"我的"
      },
    
  ];

  List<BottomNavigationBarItem> _bottomNavItems(){
    return List.generate(_tabList.length, (index){
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!,width: 30,height: 30,),
        activeIcon: Image.asset(_tabList[index]["active_icon"]!,width: 30,height: 30,),
        label: _tabList[index]["text"]!,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0)
      );
    });
  }
  List<Widget> _pages() {
    return [
      HomeView(),
      CategoryView(),
      CartView(),
      MineView(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: SafeArea(child: IndexedStack(
        index: _currentIndex,
        children: _pages(),
      )),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: _bottomNavItems(),
          // unselectedLabelStyle: TextStyle(color: Colors.white),
          currentIndex: _currentIndex,
          selectedItemColor: const Color.fromARGB(255, 204, 121, 218),
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },

        ),
      )

    );
  }
}