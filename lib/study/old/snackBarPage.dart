import 'package:flutter/material.dart';

class SnackBarPage extends StatefulWidget {
  _SnackBarPage  createState()=> _SnackBarPage();
} 

class _SnackBarPage extends State<SnackBarPage> {
  static GlobalKey<ScaffoldState> _globalKey= GlobalKey();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("Snackbar Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                child: Text("SnackBar1" ),
                onPressed: () {
                  // 查找父级最近的Scaffold对应的ScaffoldState对象
                  ScaffoldState? _state = context.findAncestorStateOfType<ScaffoldState>();
                  //调用ScaffoldState的showSnackBar来弹出SnackBar
                  // _state!.showSnackBar(
                  //   SnackBar(
                  //     content: Text("我是SnackBar"),
                  //   ),
                  // );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("我是SnackBar")));
                }
            ),
            ElevatedButton(
                child: Text("SnackBar2" ),
                onPressed: () {
                  // 查找父级最近的Scaffold对应的ScaffoldState对象
                  ScaffoldState? _state = context.findAncestorStateOfType();
                  //调用ScaffoldState的showSnackBar来弹出SnackBar
                  // _state!.showSnackBar(
                  //   SnackBar(
                  //     content: Text("我是SnackBar"),
                  //   ),
                  // );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("我是SnackBar")));
                }
            ),
            ElevatedButton(
                child: Text("SnackBar3" ),
                onPressed: () {
                  // 查找父级最近的Scaffold对应的ScaffoldState对象
                  ScaffoldState _state=Scaffold.of(context);
                  //调用ScaffoldState的showSnackBar来弹出SnackBar
                  // _state.showSnackBar(
                  //   SnackBar(
                  //     content: Text("我是SnackBar"),
                  //   ),
                  // );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("我是SnackBar")));
                }
            ),
          ],
        ),
      ),
    );
  }
}
