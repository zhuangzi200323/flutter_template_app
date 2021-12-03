import 'package:flutter/material.dart';
import 'package:flutter_template_app/animation/old/AniGrowTransition.dart';
import 'package:flutter_template_app/animation/old/AniMain.dart';
import 'package:flutter_template_app/animation/old/AniOpacity.dart';
import 'package:flutter_template_app/animation/old/AniScale.dart';
import 'package:flutter_template_app/animation/old/AniScale2.dart';
import 'package:flutter_template_app/animation/old/AniScale3.dart';
import 'package:flutter_template_app/animation/old/AnimatedDecorateBoxRoute.dart';
import 'package:flutter_template_app/animation/old/AnimatedSwitcherCounterRoute.dart';
import 'package:flutter_template_app/animation/old/AnimatedSwitcherCounterRoute2.dart';
import 'package:flutter_template_app/animation/old/AnimatedSwitcherCounterRoute3.dart';
import 'package:flutter_template_app/animation/old/AnimatedSwitcherCounterRoute4.dart';
import 'package:flutter_template_app/animation/old/AnimatedSwitcherCounterRoute5.dart';
import 'package:flutter_template_app/animation/old/AnimatedSwitcherCounterRoute6.dart';
import 'package:flutter_template_app/animation/old/AnimatedSwitcherCounterRoute7.dart';
import 'package:flutter_template_app/animation/old/AnimatedSwitcherCounterRoute8.dart';
import 'package:flutter_template_app/animation/old/AnimatedWidgetsTest.dart';
import 'package:flutter_template_app/animation/old/StaggerRoute.dart';
import 'package:flutter_template_app/combination/GradientButtonRoute.dart';
import 'package:flutter_template_app/dialog/MyDialog.dart';
import 'package:flutter_template_app/dialog/MyDialog2.dart';
import 'package:flutter_template_app/hero/HeroAnimationRoute.dart';
import 'package:flutter_template_app/hero/HeroMain.dart';
import 'package:flutter_template_app/provider/ProviderRoute.dart';
import 'package:flutter_template_app/sharedata/InheritedWidgetTestRoute.dart';
import 'package:flutter_template_app/study/CameraExampleHome.dart';
import 'package:flutter_template_app/study/CustomizePage.dart';
import 'package:flutter_template_app/study/LoginPage.dart';
import 'package:flutter_template_app/study/PullRefreshPage.dart';
import 'package:flutter_template_app/study/RegisterPage.dart';
import 'package:flutter_template_app/study/ScanPage.dart';
import 'package:flutter_template_app/study/SlamMapInfoPage.dart';
import 'package:flutter_template_app/study/VerifyCodePage1.dart';
import 'package:flutter_template_app/study/VerifyCodePage2.dart';
import 'package:flutter_template_app/study/VideoFullPage.dart';
import 'package:flutter_template_app/study/VideoPage.dart';
import 'package:flutter_template_app/study/WebViewExample.dart';
import 'package:flutter_template_app/study/old/ButtonPage.dart';
import 'package:flutter_template_app/study/old/CameraRoute.dart';
import 'package:flutter_template_app/study/old/CustomScrollViewTestRoute.dart';
import 'package:flutter_template_app/study/old/DetailPage.dart';
import 'package:flutter_template_app/study/old/DioStudy.dart';
import 'package:flutter_template_app/study/old/FileOperationRoute.dart';
import 'package:flutter_template_app/study/old/FlexPage.dart';
import 'package:flutter_template_app/study/old/FocusTestRoute.dart';
import 'package:flutter_template_app/study/old/FutureBuilderPage.dart';
import 'package:flutter_template_app/study/old/HttpTestPage.dart';
import 'package:flutter_template_app/study/old/InfiniteGridView.dart';
import 'package:flutter_template_app/study/old/InfiniteListView.dart';
import 'package:flutter_template_app/study/old/ListPage.dart';
import 'package:flutter_template_app/study/old/Listview.dart';
import 'package:flutter_template_app/study/old/Listview2.dart';
import 'package:flutter_template_app/study/old/Listview3.dart';
import 'package:flutter_template_app/study/old/ListviewWithHead.dart';
import 'package:flutter_template_app/study/old/PathProviderStudy.dart';
import 'package:flutter_template_app/study/old/ProgressRoute.dart';
import 'package:flutter_template_app/study/old/ScaffoldRoute.dart';
import 'package:flutter_template_app/study/old/ScrollControllerTestRoute.dart';
import 'package:flutter_template_app/study/old/ScrollNotificationTestRoute.dart';
import 'package:flutter_template_app/study/old/SingleChildScrollViewTestRoute.dart';
import 'package:flutter_template_app/study/old/StreamBuilderPage.dart';
import 'package:flutter_template_app/study/old/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_template_app/study/old/WebSocketRoute.dart';
import 'package:flutter_template_app/study/old/WillPopScopeTestRoute.dart';
import 'package:flutter_template_app/study/old/page2.dart';
import 'package:flutter_template_app/study/old/snackBarPage.dart';
import 'package:flutter_template_app/study/old/theme/ThemeTestRoute.dart';

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
  "PullRefreshPage":(context, {arguments})=>PullRefreshPage(),
  "ScanPage":(context, {arguments})=>ScanPage(),
  "CustomizePage":(context, {arguments})=>CustomizePage(),
  "SlamMapInfoPage":(context, {arguments})=>SlamMapInfoPage(),
  //old study content
  "ListPage":(context, {arguments})=>ListPage(),
  "LoginPage":(context, {arguments})=>LoginPage(),
  "Page2":(context, {arguments})=>Page2(),
  "DetailPage":(context, {arguments})=>DetailPage(arguments: arguments),
  "ButtonPage":(context, {arguments})=>ButtonPage(),
  "AnimateMain":(context, {arguments})=>AniMain(),
  "AniOpacity":(context, {arguments})=>AniOpacity(),
  "AniScale":(context, {arguments})=>AniScale(),
  "AniScale2":(context, {arguments})=>AniScale2(),
  "AniScale3":(context, {arguments})=>AniScale3(),
  "AniGrowTransition":(context, {arguments})=>AniGrowTransition(),
  "HeroMain":(context, {arguments})=>HeroMain(),
  "HeroAnimationRoute":(context, {arguments})=>HeroAnimationRoute(),
  "StaggerRoute": (context, {arguments})=>StaggerRoute(),
  "AnimatedSwitcherCounterRoute": (context, {arguments})=>AnimatedSwitcherCounterRoute(),
  "AnimatedSwitcherCounterRoute2": (context, {arguments})=>AnimatedSwitcherCounterRoute2(),
  "AnimatedSwitcherCounterRoute3": (context, {arguments})=>AnimatedSwitcherCounterRoute3(),
  "AnimatedSwitcherCounterRoute4": (context, {arguments})=>AnimatedSwitcherCounterRoute4(),
  "AnimatedSwitcherCounterRoute5": (context, {arguments})=>AnimatedSwitcherCounterRoute5(),
  "AnimatedSwitcherCounterRoute6": (context, {arguments})=>AnimatedSwitcherCounterRoute6(),
  "AnimatedSwitcherCounterRoute7": (context, {arguments})=>AnimatedSwitcherCounterRoute7(),
  "AnimatedSwitcherCounterRoute8": (context, {arguments})=>AnimatedSwitcherCounterRoute8(),
  "AnimatedDecorateBoxRoute": (context, {arguments})=>AnimatedDecorateBoxRoute(),
  "AnimatedWidgetsTest": (context, {arguments})=>AnimatedWidgetsTest(),
  "FlexPage":(context, {arguments})=>FlexPage(),
  "HttpTestPage":(context, {arguments})=>HttpTestPage(),
  "FutureBuilderPage":(context, {arguments})=>FutureBuilderPage(),
  "SnackBarPage":(context, {arguments})=>SnackBarPage(),
  "SwitchAndCheckBoxTestRoute":(context, {arguments})=>SwitchAndCheckBoxTestRoute(),
  "FocusTestRoute":(context, {arguments})=>FocusTestRoute(),
  "ProgressRoute":(context, {arguments})=>ProgressRoute(),
  "ScaffoldRoute":(context, {arguments})=>ScaffoldRoute(),
  "SingleChildScrollViewTestRoute":(context, {arguments})=>SingleChildScrollViewTestRoute(),
  "Listview":(context, {arguments})=>Listview(),
  "Listview2":(context, {arguments})=>Listview2(),
  "Listview3":(context, {arguments})=>Listview3(),
  "InfiniteListView":(context, {arguments})=>InfiniteListView(),
  "ListviewWithHead":(context, {arguments})=>ListviewWithHead(),
  "InfiniteGridView":(context, {arguments})=>InfiniteGridView(),
  "CustomScrollViewTestRoute":(context, {arguments})=>CustomScrollViewTestRoute(),
  "ScrollControllerTestRoute":(context, {arguments})=>ScrollControllerTestRoute(),
  "ScrollNotificationTestRoute":(context, {arguments})=>ScrollNotificationTestRoute(),
  "WillPopScopeTestRoute":(context, {arguments})=>WillPopScopeTestRoute(),
  "InheritedWidgetTestRoute":(context, {arguments})=>InheritedWidgetTestRoute(),
  "ProviderRoute":(context, {arguments})=>ProviderRoute(),
  "ThemeTestRoute":(context, {arguments})=>ThemeTestRoute(),
  "StreamBuilderPage":(context, {arguments})=>StreamBuilderPage(),
  "MyDialog":(context, {arguments})=>MyDialog(),
  "MyDialog2":(context, {arguments})=>MyDialog2(),
  "GradientButtonRoute":(context, {arguments})=>GradientButtonRoute(),
  "FileOperationRoute":(context, {arguments})=>FileOperationRoute(),
  "PathProviderStudy":(context, {arguments})=>PathProviderStudy(title: 'PathProviderStudy',),
  "DioStudy":(context, {arguments})=>DioStudy(),
  "WebSocketRoute":(context, {arguments})=>WebSocketRoute(),
  "CameraRoute":(context, {arguments})=>CameraRoute(),
};

//路由跳转，可转参数
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if(pageContentBuilder != null){
    if(settings.arguments != null){
      print("#####${settings.arguments}");
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