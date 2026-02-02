class BannerItem{
   String? id;
   String imgUrl;
   BannerItem({required this.id, required this.imgUrl});
   factory BannerItem.fromJson(Map<String,dynamic> json){
    return BannerItem(id: json['id'] ?? "", imgUrl: json['imgUrl'] ?? "");
   }
}
// {id: 1181622001, name: 气质女装, picture: https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png, children: [{id: 1191110001, name: 半裙, picture: https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView, children: null, goods: null}
//根据 json编写 class 和工厂转化函数
class CategoryItem{
  String? id;
  String name;
  String? picture;
  List<CategoryItem>? children;
  CategoryItem({required this.id, required this.name, this.picture, this.children});
  factory CategoryItem.fromJson(Map<String,dynamic> json){
    return CategoryItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      picture: json['picture'] ?? "",
      children: json['children'] != null ? (json['children'] as List).map((e) => CategoryItem.fromJson(e)).toList() : null,
    );
  }
}