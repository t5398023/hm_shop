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
  Widget _getSlider(){
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: List.generate(widget.banners.length, (index) => Image.network(widget.banners[index].imgUrl,fit: BoxFit.cover,width: screenWidth)), 
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,

    ));
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getSlider(),
      ]
    );
  }
}