import 'package:flutter/material.dart';

class AniScale2 extends StatefulWidget {
  _AniScalePage  createState()=> _AniScalePage();
} 

class _AniScalePage extends State<AniScale2>  with SingleTickerProviderStateMixin {

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
        body: AnimatedImage(animation: animation,)
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return new Center(
      child: Image.asset("resources/images/logo.png",
          width: animation.value,
          height: animation.value
      ),
    );
  }
}

