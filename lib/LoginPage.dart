import 'package:flutter/material.dart';
import 'package:flutter_template_app/generated/l10n.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode blankNode = FocusNode();
  //定义controller
  TextEditingController mailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool showMailTextEditClearIcon = false;
  bool showPwdTextEditClearIcon = false;
  bool showPwd = false;

  void mailTextEditValueChange(String value) {
    setState(() {
      showMailTextEditClearIcon = value.length > 0;
    });
  }

  void pwdTextEditValueChange(String value) {
    setState(() {
      showPwdTextEditClearIcon = value.length > 0;
    });
  }

  Widget getPwdIcons() {
    return Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            showPwdTextEditClearIcon ? IconButton(icon: Image.asset('resources/images/close.png'),
                onPressed: (){
                  pwdController.clear();
                  pwdTextEditValueChange("");
                }) : SizedBox(),
            IconButton(icon: showPwd ? Image.asset('resources/images/eye_p.png') : Image.asset('resources/images/eye.png'),
                onPressed: (){
                  setState(() {
                    showPwd = !showPwd;
                  });
                })
          ],
        )
    );
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
              Image.asset('resources/images/logo.png'),
              Padding(padding: EdgeInsets.only(top: 30)),
              Column(
                children: <Widget>[
                  Form(
                      key: formKey,
                      child: Column(
                          children: <Widget>[
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.green,
                              //autofocus: false,
                              controller: mailController,
                              onChanged: (value) {
                                mailTextEditValueChange(value);
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10, right: 10),
                                labelText: S.of(context).mail,
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: S.of(context).pls_input_email,
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.mail),
                                suffixIcon: showMailTextEditClearIcon ? IconButton(icon: Image.asset('resources/images/close.png'),
                                    onPressed: (){
                                      mailController.clear();
                                      mailTextEditValueChange("");
                                    }) : null,
                                focusedBorder: UnderlineInputBorder(  //选中时下边框颜色
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                              validator: (value) {
                                RegExp reg = new RegExp(r'^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$');
                                if (!reg.hasMatch(value!)) {
                                  return S.of(context).pls_input_right_email;
                                }
                                return null;
                              },
                            ),
                            Padding(padding: EdgeInsets.only(top: 20)),
                            TextFormField(
                              controller: pwdController,
                              onChanged: (value) {
                                pwdTextEditValueChange(value);
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10, right: 10),
                                labelText: S.of(context).password,
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: S.of(context).pls_input_password,
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: getPwdIcons(),
                                focusedBorder: UnderlineInputBorder(  //选中时下边框颜色
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).pls_input_password;
                                }
                                return null;
                              },
                              obscureText: !showPwd,
                            ),
                          ]
                      )
                  ),
                  Row(
                      children: <Widget>[
                        TextButton(
                          child: Text(S.of(context).register),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('注册功能，未完待续...'),
                            ));
                          },
                        ),
                        Expanded(child: SizedBox()),
                        TextButton(
                          style: ButtonStyle(alignment: Alignment.centerRight),
                          child: Text(S.of(context).forget_password),
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
                                child: Text(S.of(context).login)
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