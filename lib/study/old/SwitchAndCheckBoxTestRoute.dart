import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  _SwitchAndCheckBoxTestRouteState createState() => new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SwitchAndCheckBoxTestRoute"),
        ),
        body:Column(
          children: <Widget>[
            CheckboxListTile(
              secondary: const Icon(Icons.alarm_on),
              title: const Text('每天6：10 响铃'),
              subtitle: const Text('12小时58分钟后响铃'),
              value: _switchSelected,
              onChanged: (bool? value) {
                setState(() {
                  _switchSelected = value!;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                  value: _switchSelected,//当前状态
                  onChanged:(value){
                    //重新构建页面
                    setState(() {
                      _switchSelected=value;
                    });
                  },
                ),
                Text(_switchSelected ? "选中" : "未选中")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red, //选中时的颜色
                  onChanged:(value){
                    setState(() {
                      _checkboxSelected=value!;
                    });
                  } ,
                ),
                Text(_checkboxSelected ? "选中" : "未选中")
              ],
            ),
          ],
        )
    );
  }
}