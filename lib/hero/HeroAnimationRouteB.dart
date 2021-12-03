import 'package:flutter/material.dart';

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("B"),
        ),
        body: Center(
          child: Hero(
            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
            child: Image.asset("resources/images/logo.png"),
          ),
        )
    );
  }
}