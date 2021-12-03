import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    print(args);
    //定义一个controller
    TextEditingController _unameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2 title"),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text("page 2"),
              ElevatedButton(
                child: Text("ListPage" ),
                onPressed: () {
                  //根据命名路由做跳转
                  Navigator.pushNamed(context, "ListPage", arguments: ModalRoute.of(context)!.settings.arguments);
                },
              ),
              Column(
                children: <Widget>[
                  TextField(
                    cursorColor: Colors.green,
                    autofocus: false,
                    controller: _unameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left:50),
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      //prefixIcon: Icon(Icons.mail),
                      //suffixIcon: IconButton(icon: Icons.close, ),
                      // enabledBorder: OutlineInputBorder( //未选中时候的颜色
                      //   borderRadius: BorderRadius.circular(5.0),
                      //   borderSide: BorderSide(color: Color(0xff9e51ff),),
                      // ),
                      // focusedBorder: OutlineInputBorder( //选中时外边框颜色
                      //   borderRadius: BorderRadius.circular(5.0),
                      //   borderSide: BorderSide(color: Color(0xff2e33ff),),
                      // ),
                      focusedBorder: UnderlineInputBorder(  //选中时下边框颜色
                        borderSide: BorderSide(color: Colors.green),
                      ),

                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        prefixIcon: Icon(Icons.lock)
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}