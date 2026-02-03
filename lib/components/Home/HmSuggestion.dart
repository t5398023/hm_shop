import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class HmSuggestion extends StatefulWidget {
  final SuggestionResult suggestionResult;
  const HmSuggestion({super.key, required this.suggestionResult});

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  //取 3 条
  List<SuggestionGoodsItem> _getDisplayItmes() {
    if (widget.suggestionResult.subTypes.isEmpty) {
      return [];
    }
    return widget.suggestionResult.subTypes.first.goodsItems.items
        // .take(3)
        .toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.0, top: 5.0),
          child: Text(
            "特惠推荐",
            style: TextStyle(
              color: const Color.fromARGB(255, 63, 60, 60),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // SizedBox(width: 10.0),
        Padding(
          padding: EdgeInsets.only(left: 5, top: 0.0),
          child: Text(
            "精选省攻略",
            style: TextStyle(
              color: const Color.fromARGB(255, 108, 105, 105),
              fontSize: 10.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getChildrenList() {
    List<SuggestionGoodsItem> items = _getDisplayItmes();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          // height: 50,
          decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 236, 236, 236),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 80,
                  height: 110,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(items[index].picture ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                "¥${items[index].price ?? 0}",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              )
            ],
          ),
        );
      },
    );
    // return List.generate(items.length, (index){
    //    return Column(
    //       children: [
    //        ClipRRect(
    //         borderRadius: BorderRadius.circular(10),
    //         child: Container(
    //           width: 80,
    //           height: 120,
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             image: DecorationImage(
    //               image: NetworkImage(items[index].picture ?? ""),
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 5.0),
    // Text(
    //   "¥${items[index].price ?? 0}",
    //   style: TextStyle(
    //     color: Colors.white,
    //     fontSize: 12.0,
    //   ),
    // ),
    // ],
    //    );
    // });
  }

  Widget _buildBody() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0),
          width: 80,
          height: 140,
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("lib/assets/Home/limit_time.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // _getChildrenList()
        //
        Expanded(//作用占满剩余空间
          
          child:
           Container(
            // width: ,
            margin: EdgeInsets.only(left: 10.0,top: 10.0),
            height: 140,
            // color: Colors.blue,
            child: _getChildrenList(),
          ),
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // children: _getChildrenList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: EdgeInsets.only(left: 8, top: 5.0, right: 8),
        height: 200,
        // color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(224, 219, 165, 143),
          // image: DecorationImage(
          //   image: AssetImage("lib/assets/Home/suggestion_bg.png"),
          //   fit: BoxFit.cover,
          // ),
        ),
        alignment: Alignment.center,
        child: Column(children: [_buildHeader(), _buildBody()]),
      ),
    );
  }
}
