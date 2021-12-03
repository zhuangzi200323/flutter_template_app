import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final arguments;

  DetailPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("#############${arguments}");
    print(ModalRoute.of(context)!.settings.arguments);
    //获取路由传参
    //final Map args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Map args = arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body:
        new Column(
          children: <Widget>[
            Text("我是Detail页面"),
            Text("id:${args['id']}" ),
            Text("id:${args['title']}"),
            Text("id:${args['subtitle']}")
          ],
        )
    );
  }
}