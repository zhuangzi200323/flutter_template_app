import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode blankNode = FocusNode();
  //定义一个controller
  TextEditingController mailController = TextEditingController();
  bool showMailTextEditClearIcon = false;
  bool showPwdTextEditClearIcon = false;

  void mailTextEditValueChange(String value) {
    print("4444444444 = " + value + ", showMailTextEditClearIcon = " + showMailTextEditClearIcon.toString());
    setState(() {
      showMailTextEditClearIcon = value.length > 0;
    });
  }

  void pwdTextEditValueChange(String value) {
    setState(() {
      showPwdTextEditClearIcon = value.length > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return GestureDetector(
        onTap: () {
          //点击空白区域时隐藏输入法
          FocusScope.of(context).requestFocus(blankNode);
        },
        child: Scaffold(
          body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: statusBarHeight)),
              Padding(padding: EdgeInsets.only(top: 30)),
              Image.asset('images/logo.png'),
              Padding(padding: EdgeInsets.only(top: 30)),
              Column(
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          cursorColor: Colors.green,
                          //autofocus: false,
                          controller: mailController,
                          onChanged: (value) {
                            mailTextEditValueChange(value);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10, right: 10),
                            labelText: "邮箱",
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "请输入邮箱",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.mail),
                            suffixIcon: showMailTextEditClearIcon ? Image.asset('images/close18x18.png') : null,
                            focusedBorder: UnderlineInputBorder(  //选中时下边框颜色
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                          validator: (value) {
                            RegExp reg = new RegExp(r'^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$');
                            if (!reg.hasMatch(value!)) {
                              return '请输入正确的邮箱';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        TextFormField(
                          onChanged: (value) {
                            pwdTextEditValueChange(value);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10, right: 10),
                            labelText: "密码",
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "请输入密码",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.lock),
                            focusedBorder: UnderlineInputBorder(  //选中时下边框颜色
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '请输入密码';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                      ]
                    )
                  ),
                  Row(
                    children: <Widget>[
                      TextButton(
                        child: Text('注册'),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('注册功能，未完待续...'),
                          ));
                        },
                      ),
                      Expanded(child: SizedBox()),
                      TextButton(
                        style: ButtonStyle(alignment: Alignment.centerRight),
                        child: Text('忘记密码？'),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('忘记密码功能，未完待续...'),
                          ));
                        },
                      ),
                    ]
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20,),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('登录功能，未完待续...'),
                                  ));
                                }
                              },
                              style: ButtonStyle(
                                shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                              ),
                              child: Text('登录')
                          )
                      ),
                      SizedBox(width: 20,),
                    ]
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}