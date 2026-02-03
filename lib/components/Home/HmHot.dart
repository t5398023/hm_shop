import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class HmHot extends StatefulWidget {
  final SuggestionResult result;
  final String type;
  const HmHot({super.key, required this.result, required this.type});

  @override
  _HmHotState createState() => _HmHotState();
}


class _HmHotState extends State<HmHot> {
  //取 3 条
  List<SuggestionGoodsItem> get _displayItmes{
    if (widget.result.subTypes.isEmpty) {
      return [];
    }
    return widget.result.subTypes.first.goodsItems.items
        // .take(3)
        .toList();
  }
  Widget _getChildrenList() {
    // List<SuggestionGoodsItem> items = _getDisplayItmes();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _displayItmes.length,
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
                      image: NetworkImage(_displayItmes[index].picture ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                "¥${_displayItmes[index].price ?? 0}",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              )
            ],
          ),
        );
      },
    );
  }
     Widget _buildHeader() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.0, top: 5.0),
          child: Text(
            widget.type == "inVogue" ? "一站全买" : "爆款推荐",

            style: TextStyle(
              color: const Color.fromARGB(255, 68, 63, 63),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // SizedBox(width: 10.0),
        Padding(
          padding: EdgeInsets.only(left: 5, top: 0.0),
          child: Text(
            widget.type == "inVogue" ? "精心优先" : "最受欢迎",
            style: TextStyle(
              color: const Color.fromARGB(255, 48, 45, 45),
              fontSize: 10.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildBody() {
    return Row(
      children: [
        // Container(
        //   margin: EdgeInsets.only(top: 10.0),
        //   width: 80,
        //   height: 140,
        //   decoration: BoxDecoration(
        //     // color: Colors.red,
        //     borderRadius: BorderRadius.circular(10),
        //     image: DecorationImage(
        //       image: AssetImage("lib/assets/Home/limit_time.png"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        // _getChildrenList()
        //
        Expanded(//作用占满剩余空间
          
          child:
           Container(
            // width: ,
            margin: EdgeInsets.only(top: 10.0),
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
    return Container(
        padding: EdgeInsets.only(left: 8, top: 5.0, right: 8),
        height:200,
        // color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.type == "inVogue"
              ? const Color.fromARGB(227, 147, 171, 231)
              : const Color.fromARGB(227, 202, 209, 137),
          // image: DecorationImage(
          //   image: AssetImage("lib/assets/Home/suggestion_bg.png"),
          //   fit: BoxFit.cover,
          // ),
        ),
        alignment: Alignment.center,
        child: Column(children: [_buildHeader(), _buildBody()]),
    );
  }
  
}
