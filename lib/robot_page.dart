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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("LoginPage"),
                    onPressed: () {
                      Navigator.pushNamed(context, "LoginPage");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("RegisterPage"),
                    onPressed: () {
                      Navigator.pushNamed(context, "RegisterPage");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("VerifyCodePage1"),
                    onPressed: () {
                      Navigator.pushNamed(context, "VerifyCodePage1");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("VerifyCodePage2"),
                    onPressed: () {
                      Navigator.pushNamed(context, "VerifyCodePage2");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("WebViewExample"),
                    onPressed: () {
                      Navigator.pushNamed(context, "WebViewExample");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("CameraExampleHome"),
                    onPressed: () {
                      Navigator.pushNamed(context, "CameraExampleHome");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("VideoPage"),
                    onPressed: () {
                      Navigator.pushNamed(context, "VideoPage");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("PullRefreshPage"),
                    onPressed: () {
                      Navigator.pushNamed(context, "PullRefreshPage");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("ScanPage"),
                    onPressed: () {
                      Navigator.pushNamed(context, "ScanPage");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("Customize page"),
                    onPressed: () {
                      Navigator.pushNamed(context, "CustomizePage");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("Customize page 2"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return CustomizePage2();
                      }));
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("Customize page final"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return CustomizePage3();
                      }));
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("SlamMapInfo page"),
                    onPressed: () {
                      Navigator.pushNamed(context, "SlamMapInfoPage");
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("PathProviderDemo page"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return PathProviderDemo();
                      }));
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    child: const Text("PhotoViewDemo page"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return HomeScreen();
                      }));
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ]
            ),
          ],
        ),
      ),
    );
  }
}