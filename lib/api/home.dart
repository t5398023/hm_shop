//封住 api 返回业务侧要返回的数据
import 'package:hm_shop/contsants/Net/index.dart';
import 'package:hm_shop/utils/Net/DioRequest.dart';
import 'package:hm_shop/viewmodels/Home/BannerItem.dart';

class HomeApi{

  Future<List<BannerItem>> getBanners() async{
    final data = await dioRequest.get(NetConstants.BANNER_LIST);
    return (data as List).map((e) => BannerItem.fromJson(e)).toList();
  }
  Future<List<CategoryItem>> getCategory() async{
    final data = await dioRequest.get(NetConstants.CATEGORY_LIST);
   
    return (data as List).map((e) => CategoryItem.fromJson(e)).toList();
  }

}
final homeApi = HomeApi();