import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listview"),
      ),
      body: Scrollbar( // 显示进度条
        child: ListView(
          itemExtent: 50,
          shrinkWrap: true,
          //padding: EdgeInsets.all(16.0),
          children: const <Widget>[
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