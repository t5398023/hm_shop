
import 'package:hm_shop/contsants/Net/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager{
  //初始化 token
  //返回持久化对象的实例对象
  Future<SharedPreferences> _getInstance(){
    return SharedPreferences.getInstance();
  }
  String _token = '';
   Future<void> init() async{
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? "";
   }
   Future<void> setToken(String val) async{ 
    //1、获取持久化实例
     final prefs = await _getInstance();
     prefs.setString(GlobalConstants.TOKEN_KEY, val);
     _token = val;
   }
   String getToken() {
    return _token;
   }
   Future<void> removeToken() async{
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY);//磁盘上删除
    _token = '';//内存中删除
   }
}
final tokenManager = TokenManager();