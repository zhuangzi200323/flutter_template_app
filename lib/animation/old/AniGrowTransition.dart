import 'package:flutter/material.dart';
import 'package:flutter_template_app/animation/old/GrowTransition.dart';

class AniGrowTransition extends StatefulWidget {
  _AniGrowTransitionPage  createState()=> _AniGrowTransitionPage();
} 

class _AniGrowTransitionPage extends State<AniGrowTransition>  with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  initState() {
    super.initState();
    controller =  AnimationController(duration:  Duration(seconds: 3), vsync: this);

     //使用弹性曲线，数据变化从0到300
     animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
     animation = Tween(begin: 0.0, end: 300.0).animate(animation);

    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Animate Page"),
        ),
        body: GrowTransition(
          child: Image.asset("resources/images/logo.png"),
          animation: animation,
        )
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

