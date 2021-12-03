import 'package:flutter/material.dart';

class ListviewWithHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("ListviewWithHead"),
      ),
      body: Scrollbar( // 显示进度条
        child: Column(children: <Widget>[
          ListTile(title:Text("商品列表")),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("$index"));
              }),
          ),
        ]),
      ),
    );
  }
}