import 'package:flutter/material.dart';

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollViewTestRoute"),
      ),
      body: Scrollbar( // 显示进度条
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              //动态创建一个List<Widget>
              children: str.split("")
              //每一个字母都用一个Text显示,字体为原来的两倍
                  .map((c) => Text(c, textScaleFactor: 2.0,))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}