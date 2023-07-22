import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_app/utils/Constants.dart';
import 'package:flutter_template_app/study/RegisterPage.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
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
      showMailTextEditClearIcon = value.isNotEmpty;
    });
  }

  void pwdTextEditValueChange(String value) {
    setState(() {
      showPwdTextEditClearIcon = value.isNotEmpty;
    });
  }

  Widget getPwdIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        showPwdTextEditClearIcon ? IconButton(icon: Image.asset('resources/images/close.png'),
            onPressed: (){
              pwdController.clear();
              pwdTextEditValueChange("");
            }) : const SizedBox(),
        IconButton(icon: showPwd ? Image.asset('resources/images/eye_p.png') : Image.asset('resources/images/eye.png'),
            onPressed: (){
              setState(() {
                showPwd = !showPwd;
              });
            })
      ],
    );
  }

  void showMyDlg(BuildContext context){
    showDialog<bool>(context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                Flexible(
                    child: Text(S.of(context).agreement_policy_title, style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Flexible(
                      child: Text(S.of(context).agreement_policy_welcome),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Flexible(
                      child:
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: S.of(context).read_agreement_prefix),
                          TextSpan(text: S.of(context).user_agreement,
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('用户协议，未完待续...'),
                                ));
                              }),
                          TextSpan(text: S.of(context).and),
                          TextSpan(text: S.of(context).private_policy, style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('隐私政策，未完待续...'),
                                ));
                              }),
                          TextSpan(text: S.of(context).end_punctuation),
                        ]
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: (){
                            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                            backgroundColor: MaterialStateProperty.all(Colors.yellow[700]),
                          ),
                          child: Text(S.of(context).reject),
                        )
                    ),
                    const Expanded(flex: 1,child: SizedBox(),),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: (){
                            saveUserAgreeLicense();
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                            backgroundColor: MaterialStateProperty.all(Colors.green[600]),
                          ),
                          child: Text(S.of(context).agree),
                        )
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
          );
        });
  }

  Future<void> saveUserAgreeLicense() async {
    final SharedPreferences pref = await prefs;
    pref.setBool(Constants.AGREE_LICENSE, true);
  }

  Future<void> showLicenseDlg() async {
    final SharedPreferences pref = await prefs;
    bool? isAgree = pref.getBool(Constants.AGREE_LICENSE);
    if (isAgree == null || !isAgree){
      showMyDlg(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    Future.delayed(const Duration(milliseconds: 500), (){
      showLicenseDlg();
    });

    return GestureDetector(
      onTap: () {
        //点击空白区域时隐藏输入法
        FocusScope.of(context).requestFocus(blankNode);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("LoginPage"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: statusBarHeight)),
              const Padding(padding: EdgeInsets.only(top: 30)),
              Image.asset('resources/images/logo.png'),
              const Padding(padding: EdgeInsets.only(top: 30)),
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
                                focusedBorder: const UnderlineInputBorder(  //选中时下边框颜色
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
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            TextFormField(
                              controller: pwdController,
                              onChanged: (value) {
                                pwdTextEditValueChange(value);
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10, right: 10),
                                labelText: S.of(context).password,
                                labelStyle: const TextStyle(color: Colors.black),
                                hintText: S.of(context).pls_input_password,
                                hintStyle: const TextStyle(color: Colors.grey),
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: getPwdIcons(),
                                focusedBorder: const UnderlineInputBorder(  //选中时下边框颜色
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
                            Navigator.push(context, MaterialPageRoute(builder:(context) {
                              return RegisterPage();
                            }));
                          },
                        ),
                        const Expanded(child: SizedBox()),
                        TextButton(
                          style: const ButtonStyle(alignment: Alignment.centerRight),
                          child: Text(S.of(context).forget_password),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('忘记密码功能，未完待续...'),
                            ));
                          },
                        ),
                      ]
                  ),
                  Row(
                      children: <Widget>[
                        const SizedBox(width: 20,),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('登录功能，未完待续...'),
                                    ));
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                                ),
                                child: Text(S.of(context).login)
                            )
                        ),
                        const SizedBox(width: 20,),
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