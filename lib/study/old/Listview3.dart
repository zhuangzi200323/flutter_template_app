import 'package:flutter/material.dart';

class Listview3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = const Divider(color: Colors.blue, height: .0,);
    Widget divider2 = const Divider(color: Colors.green, height: .0,);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView3"),
      ),
      body: Scrollbar( // 显示进度条
        child: ListView.separated(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
                onTap: (){
                  print("######");
                  },);
            },
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            return index%2==0 ? divider1 : divider2;
          },
        ),
      ),
    );
  }
}