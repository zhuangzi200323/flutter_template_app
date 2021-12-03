import 'package:flutter/material.dart';

class AniScale3 extends StatefulWidget {
  _AniScalePage  createState()=> _AniScalePage();
} 

class _AniScalePage extends State<AniScale3>  with SingleTickerProviderStateMixin {

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
        body: AnimatedBuilder(
            animation: animation,
            child: Image.asset("resources/images/logo.png"),
            builder: (BuildContext ctx, Widget? child) {
              return new Center(
                child: Container(
                  height: animation.value,
                  width: animation.value,
                  child: child,
                ),
              );
            })
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

