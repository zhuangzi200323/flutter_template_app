import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  late DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WillPopScopeTestRouteState"),
      ),
      body: WillPopScope(
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          },
          child: Container(
            alignment: Alignment.center,
            child: Text("1秒内连续按两次返回键退出"),
          )
      ),
    );
  }
}