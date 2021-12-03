// 路由A
import 'package:flutter/material.dart';
import 'package:flutter_template_app/hero/HeroAnimationRouteB.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hero Main"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(
              tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset("resources/images/logo.png",
                  width: 20.0,
                ),
              ),
            ),
            onTap: () {
              //打开B路由
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return new FadeTransition(
                      opacity: animation as Animation<double>,
                      child: HeroAnimationRouteB(),
                      // Scaffold(
                      //   appBar: AppBar(
                      //     title: Text("原图"),
                      //   ),
                      //   body: HeroAnimationRouteB(),
                      // ),
                    );
                  })
              );
            },
          ),
        )
    );
  }
}