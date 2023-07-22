import 'package:flutter/material.dart';

class Listview2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview2"),
      ),
      body: Scrollbar( // 显示进度条
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            }
        ),
      ),
    );
  }
}