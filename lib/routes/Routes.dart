import 'package:flutter/material.dart';
import 'package:flutter_template_app/study/CameraExampleHome.dart';
import 'package:flutter_template_app/study/LoginPage.dart';
import 'package:flutter_template_app/study/RegisterPage.dart';
import 'package:flutter_template_app/study/VerifyCodePage1.dart';
import 'package:flutter_template_app/study/VerifyCodePage2.dart';
import 'package:flutter_template_app/study/VideoFullPage.dart';
import 'package:flutter_template_app/study/VideoPage.dart';
import 'package:flutter_template_app/study/WebViewExample.dart';

//配置路由
final routes = {
  "LoginPage":(context, {arguments})=>LoginPage(),
  "RegisterPage":(context, {arguments})=>RegisterPage(),
  "VerifyCodePage1":(context, {arguments})=>VerifyCodePage1(),
  "VerifyCodePage2": (context, {arguments})=>VerifyCodePage2(),
  "WebViewExample":(context, {arguments})=>WebViewExample(),
  "CameraExampleHome":(context, {arguments})=>CameraExampleHome(),
  "VideoPage":(context, {arguments})=>VideoPage(),
  "VideoFullPage":(context, {arguments})=>VideoFullPage(arguments: arguments),
};

//路由跳转，可转参数
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if(pageContentBuilder != null){
    if(settings.arguments != null){
      final Route route = MaterialPageRoute(
          builder: (context)=>pageContentBuilder(context, arguments:settings.arguments)
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context)=>pageContentBuilder(context)
      );
      return route;
    }
  }
}