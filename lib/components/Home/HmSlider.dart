import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> banners;
  HmSlider({Key? key,required this.banners}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  int _currentIndex = 0;
  Widget _getSlider(){
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: List.generate(widget.banners.length, (index) => Image.network(widget.banners[index].imgUrl,fit: BoxFit.cover,width: screenWidth)), 
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        }


    ));
  }
  Widget _getSearch(){
    return Positioned(
      top: 10.0,
      left: 10.0,
      right: 10.0,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(95, 0, 0, 0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            Icon(Icons.search,color: Colors.white,),
            SizedBox(width: 10.0,),
            Text("搜索",style: TextStyle(color: Colors.white,fontSize: 16.0),),
          ],
        ),
      ),
    );
  } 
  Widget _getDots(){
    return Positioned(
      bottom: 10.0,
      left: 0.0,
      right: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.banners.length, (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          width: _currentIndex == index ? 20.0 : 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(_currentIndex == index ? 1.0 : 0.5),
            borderRadius: BorderRadius.circular(5.0),
          ),
        )),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getSlider(),
        _getSearch(),  
        _getDots(),
      ]
    );
  }
}