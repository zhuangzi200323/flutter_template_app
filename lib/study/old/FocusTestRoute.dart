import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  late FocusScopeNode focusScopeNode;


  @override
  Widget build(BuildContext context) {
    // 监听焦点变化
    focusNode1.addListener((){
      print(focusNode1.hasFocus);
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FocusTestRoute"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: focusNode1,//关联focusNode1
              decoration: InputDecoration(
                  labelText: "input1"
              ),
            ),
            TextField(
              focusNode: focusNode2,//关联focusNode2
              decoration: InputDecoration(
                  labelText: "input2",
                // 未获得焦点下划线设为灰色
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
                //获得焦点下划线设为蓝色
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            Builder(builder: (ctx) {
              return Column(
                children: <Widget>[
                  ElevatedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if(null == focusScopeNode){
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  ElevatedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
            ),
            Theme(
                data: Theme.of(context).copyWith(
                    hintColor: Colors.deepOrange[200], //定义下划线颜色
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.yellow),//定义label字体样式
                        hintStyle: TextStyle(color: Colors.red, fontSize: 14.0)//定义提示文本样式
                    )
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          prefixIcon: Icon(Icons.person)
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "密码",
                          hintText: "您的登录密码",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)
                      ),
                      obscureText: true,
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}