import 'package:flutter/material.dart';
import 'package:flutter_template_app/study/CameraExampleHome.dart';
import 'package:flutter_template_app/study/LoginPage.dart';
import 'package:flutter_template_app/study/RegisterPage.dart';
import 'package:flutter_template_app/study/VerifyCodePage1.dart';
import 'package:flutter_template_app/study/VerifyCodePage2.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:flutter_template_app/study/VideoPage.dart';
import 'package:flutter_template_app/study/WebViewExampleState.dart';

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
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return LoginPage();
                  }));
                },
              ),
              ElevatedButton(
                child: Text("RegisterPage"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return RegisterPage();
                  }));
                },
              ),
              ElevatedButton(
                child: Text("VerifyCodePage1"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return VerifyCodePage1();
                  }));
                },
              ),
              ElevatedButton(
                child: Text("VerifyCodePage2"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return VerifyCodePage2();
                  }));
                },
              ),
              ElevatedButton(
                child: Text("WebViewExample"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return WebViewExample();
                  }));
                },
              ),
              ElevatedButton(
                child: Text("CameraExampleHome"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return CameraExampleHome();
                  }));
                },
              ),
              ElevatedButton(
                child: Text("VideoPage"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return VideoPage();
                  }));
                },
              ),
            ]
        ),
      ),
    );
  }
}