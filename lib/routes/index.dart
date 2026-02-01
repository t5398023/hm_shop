//管理我们的路由
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/LoginPage.dart';
import 'package:hm_shop/pages/Main/MyHomePage.dart';

Widget getRootWidget(){
  return MaterialApp(
   //命名路由
   initialRoute: '/',
   routes:getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes(){
  return {
    '/':(context)=> MyHomePage(),
    '/login':(context)=>LoginPage(),
  };
}