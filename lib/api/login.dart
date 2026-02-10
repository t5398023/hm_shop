import 'package:hm_shop/contsants/Net/index.dart';
import 'package:hm_shop/utils/Net/DioRequest.dart';
import 'package:hm_shop/viewmodels/Login/UserInfo.dart';

class LoginApi{

 Future<UserInfo> login(Map<String,dynamic> params) async{//Future<SuggestionResult> 
    final data = await dioRequest.post(NetConstants.LOGIN_URL,data: params);
    // print(data);
    // return data;
    return UserInfo.fromJson(data);
  }
  Future<UserInfo> getUserInfo() async{//Future<SuggestionResult> 
    final data = await dioRequest.get(NetConstants.USER_PROFILE);
    print(data);
    return UserInfo.fromJson(data);
  }
}
final loginApi = LoginApi();
