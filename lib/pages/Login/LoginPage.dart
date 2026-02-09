import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/login.dart';
import 'package:hm_shop/stores/UserController.dart';
import 'package:hm_shop/utils/Toast/ToastUtil.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final UserController _userController = Get.find();
  // final UserController _userController = Get.put(UserController());
  Widget _buildUserProtocos(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //选中按钮
        Checkbox(
          value: _isChecked,
          onChanged: (value){
            _isChecked = value!;
            setState(() {
              
            });
          },
        ),
        Text("我已阅读并同意"),
        Text("隐私条款",style: TextStyle(
          color: Colors.blue,
        ),),
        Text("和"),
        Text("用户协议",style: TextStyle(
          color: Colors.blue,
        ),),
      ],
    );
  }
  Widget _buildAccountField() {
    return TextFormField(
      validator: (value){
         if (value == null || value.isEmpty) {
           return "手机号不能为空";
         }
         //校验手机号的格式
         if (!RegExp(r"^1[3-9]\d{9}$").hasMatch(value)) {
           return "手机号格式错误";
         }if (value.length < 6) {
           return "密码不能少于6位";
         }  
         return null;
      },
      controller: _usernameController,
      decoration: InputDecoration(
        hintText: "请输入账号",
        fillColor: const Color.fromARGB(255, 215, 214, 214),
        filled: true,
        border: OutlineInputBorder(
          // borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
  Widget _buildPasswordField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "密码不能为空";
        }
        //密码校验 6-16 位数字 字母或下划线
        if (!RegExp(r"^[a-zA-Z0-9_]{6,16}$").hasMatch(value)) {
          return "请输入 6-16 位数字 字母或下划线";
        }
        return null;
      },
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "请输入密码",
        // labelText: "账号",
        fillColor: const Color.fromARGB(255, 215, 214, 214),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
  Future<void> _login() async {
    try {
     final rea = await loginApi.login({
        "account": _usernameController.text,
        "password": _passwordController.text,
      }); 
      print(rea);
      _userController.updateUser(rea);
      ToastUtil.show(context, "登录成功", 2);
      //登录成功后，跳转到首页
      Navigator.pop(context);
    } catch (e) {
      print(e);
      ToastUtil.show(context, (e as DioException).message ?? "登录失败", 2);
    }
  
  }
  Widget _buildLoginBtn() {
    return Container(
      // color: _isChecked ? Colors.black : Colors.grey,
      decoration: BoxDecoration(
        color: _isChecked ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(25.0),
      ),
      width: double.infinity,
      height: 50,

      child: TextButton(
        onPressed: () {
          if (!_isChecked) {
            return;
          }
          //登录逻辑
          if (_formKey.currentState!.validate()) {
           
          }
           _login();
          
        },
        child: Text(
          "登录",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
  final _formKey = GlobalKey<FormState>();
  Widget _buildContent() {
    return Container(
      // width: double.infinity,
      // height:400,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      //左边是一个返回按钮，中间是登录文案
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("账号密码登录",style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 20.0,),
          //创建一个表单，包含账号密码输入框和登录按钮
          Form(
            key: _formKey,
            child: Column(
              children: [
                //账号密码输入框
                _buildAccountField(),
                SizedBox(height: 20.0,),
                //密码输入框
                _buildPasswordField(),
                //创建隐私条款和用户协议
                _buildUserProtocos(),
                //登录按钮
                _buildLoginBtn(),
                
              ],
            ),
          ),
        ],

      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "登录",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        // children: [
        //   _buildContent(),
        // ],
        child: _buildContent(),
       ),
    );
  }
}