class BannerItem {
  String? id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? "", imgUrl: json['imgUrl'] ?? "");
  }
}

// {id: 1181622001, name: 气质女装, picture: https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png, children: [{id: 1191110001, name: 半裙, picture: https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView, children: null, goods: null}
//根据 json编写 class 和工厂转化函数
class CategoryItem {
  String? id;
  String name;
  String? picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    this.picture,
    this.children,
  });
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      picture: json['picture'] ?? "",
      children: json['children'] != null
          ? (json['children'] as List)
                .map((e) => CategoryItem.fromJson(e))
                .toList()
          : null,
    );
  }
}

class SuggestionResult {
  String id;
  String title;
  List<SuggestionSubType> subTypes;
  SuggestionResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });
  factory SuggestionResult.fromJson(Map<String, dynamic> json) {
    return SuggestionResult(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      subTypes: (json['subTypes'] as List? ?? [])
          .map((e) => SuggestionSubType.fromJson(e))
          .toList(),
    );
  }
}

class SuggestionSubType {
  String id;
  String title;
  SuggestionGoodsItems goodsItems;
  SuggestionSubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });
  factory SuggestionSubType.fromJson(Map<String, dynamic> json) {
    return SuggestionSubType(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      goodsItems: SuggestionGoodsItems.fromJson(json['goodsItems'] ?? {}),
    );
  }
}

class SuggestionGoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<SuggestionGoodsItem> items;
  SuggestionGoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });
  factory SuggestionGoodsItems.fromJson(Map<String, dynamic> json) {
    return SuggestionGoodsItems(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 0,
      items: (json['items'] as List? ?? [])
          .map((e) => SuggestionGoodsItem.fromJson(e))
          .toList(),
    );
  }
}

class SuggestionGoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;
  SuggestionGoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });
  factory SuggestionGoodsItem.fromJson(Map<String, dynamic> json) {
    return SuggestionGoodsItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      desc: json['desc'],
      price: json['price'] ?? "",
      picture: json['picture'] ?? "",
      orderNum: json['orderNum'] ?? 0,
    );
  }
}

class GoodDetailItem extends SuggestionGoodsItem {
  int payCount = 0;
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  factory GoodDetailItem.fromJson(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json['id']?.toString() ?? "",
      name: json['name']?.toString() ?? "",
      price: json['price']?.toString() ?? "",
      picture: json['picture']?.toString() ?? "",
      orderNum: int.tryParse(json['orderNum']?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json['payCount']?.toString() ?? "0") ?? 0,
    );
  }
}
