
import 'package:get/get.dart';
import 'package:hm_shop/viewmodels/Login/UserInfo.dart';

class UserController extends GetxController {
 var user = UserInfo.fromJson({}).obs;//user对象被监听
 //想要取值
  // UserInfo get getUser => user.value;
  updateUser(UserInfo newUser){
    user.value = newUser;
  }
}