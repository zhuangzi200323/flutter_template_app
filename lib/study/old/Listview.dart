import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollViewTestRoute"),
      ),
      body: Scrollbar( // 显示进度条
        child: ListView(
          itemExtent: 50,
          shrinkWrap: true,
          //padding: EdgeInsets.all(16.0),
          children: <Widget>[
            ListTile(title:Text("test")),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
            Text("test"),
          ],
        ),
      ),
    );
  }
}