import 'package:flutter/material.dart';
import 'package:flutter_template_app/study/CustomizePage2.dart';
import 'package:flutter_template_app/study/CustomizePage3.dart';
import 'package:flutter_template_app/study/photo_view_demo/home_screen.dart';

import 'PathProviderDemo.dart';

class RobotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("LoginPage"),
                onPressed: () {
                  Navigator.pushNamed(context, "LoginPage");
                },
              ),
              ElevatedButton(
                child: Text("RegisterPage"),
                onPressed: () {
                  Navigator.pushNamed(context, "RegisterPage");
                },
              ),
              ElevatedButton(
                child: Text("VerifyCodePage1"),
                onPressed: () {
                  Navigator.pushNamed(context, "VerifyCodePage1");
                },
              ),
              ElevatedButton(
                child: Text("VerifyCodePage2"),
                onPressed: () {
                  Navigator.pushNamed(context, "VerifyCodePage2");
                },
              ),
              ElevatedButton(
                child: Text("WebViewExample"),
                onPressed: () {
                  Navigator.pushNamed(context, "WebViewExample");
                },
              ),
              ElevatedButton(
                child: Text("CameraExampleHome"),
                onPressed: () {
                  Navigator.pushNamed(context, "CameraExampleHome");
                },
              ),
              ElevatedButton(
                child: Text("VideoPage"),
                onPressed: () {
                  Navigator.pushNamed(context, "VideoPage");
                },
              ),
              ElevatedButton(
                child: Text("PullRefreshPage"),
                onPressed: () {
                  Navigator.pushNamed(context, "PullRefreshPage");
                },
              ),
              ElevatedButton(
                child: Text("ScanPage"),
                onPressed: () {
                  Navigator.pushNamed(context, "ScanPage");
                },
              ),
              ElevatedButton(
                child: Text("Customize page"),
                onPressed: () {
                  Navigator.pushNamed(context, "CustomizePage");
                },
              ),
              ElevatedButton(
                child: Text("Customize page 2"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return CustomizePage2();
                  }));
                },
              ),
              ElevatedButton(
                child: Text("Customize page final"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return CustomizePage3();
                  }));
                },
              ),
              ElevatedButton(
                child: Text("SlamMapInfo page"),
                onPressed: () {
                  Navigator.pushNamed(context, "SlamMapInfoPage");
                },
              ),
              ElevatedButton(
                child: Text("PathProviderDemo page"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return PathProviderDemo();
                  }));
                },
              ),
              ElevatedButton(
                child: Text("PhotoViewDemo page"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return HomeScreen();
                  }));
                },
              ),
            ]
        ),
      ),
    );
  }
}