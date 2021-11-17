import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_app/RoundRectVerifyCode.dart';
import 'package:flutter_template_app/UnderlineVerifyCode.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyCodePage2 extends StatefulWidget {
  @override
  _VerifyCodePageState createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage2> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode blankNode = FocusNode();
  //定义controller
  TextEditingController mailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  FocusNode verifyCodeFocusNode1 = FocusNode();
  FocusNode verifyCodeFocusNode2 = FocusNode();
  FocusNode verifyCodeFocusNode3 = FocusNode();
  FocusNode verifyCodeFocusNode4 = FocusNode();
  FocusNode verifyCodeFocusNode5 = FocusNode();
  FocusNode verifyCodeFocusNode6 = FocusNode();
  FocusNode keyboardFocusNode1 = FocusNode();
  FocusNode keyboardFocusNode2 = FocusNode();
  FocusNode keyboardFocusNode3 = FocusNode();
  FocusNode keyboardFocusNode4 = FocusNode();
  FocusNode keyboardFocusNode5 = FocusNode();
  FocusNode keyboardFocusNode6 = FocusNode();
  bool showMailTextEditClearIcon = false;
  bool showPwdTextEditClearIcon = false;
  bool showPwd = false;
  var verifyCode = ["", "", "", "", "", ""];

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

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenWidth = MediaQuery.of(context).size.width;
    //6个验证码，有7个间隔，每个间隔宽度是验证码宽度的一半则6*w1+7*w2=screenWidth; w2=w1/2;
    double verifyCodeTextFieldWH = 2*screenWidth/19;
    double verifyCodeInterval = screenWidth/19;

    return GestureDetector(
      onTap: () {
        //点击空白区域时隐藏输入法
        FocusScope.of(context).requestFocus(blankNode);
      },
      child: Scaffold(
        body: Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: statusBarHeight)),
                Padding(padding: EdgeInsets.only(top: 5)),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                      Navigator.pop(context);
                    }),
                    Expanded(child: Text(S.of(context).new_user_register, textAlign: TextAlign.center,)),
                    Visibility(//保证标题居中，只是占位
                        visible: false,
                        maintainState:true,
                        maintainAnimation: true,
                        maintainSize:true,
                        child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: () {  },)
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Expanded(
                        child: Text("邮箱验证码已发送至")
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Expanded(
                        child: Text("test@134.com")
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                UnderlineVerifyCode(
                  codeLength: 6,
                  autoFocus: true,
                  textInputAction: TextInputAction.go,
                  onSubmit: (code) {
                    print('submit code:$code');
                  },
                ),
                RoundRectVerifyCode(
                  codeLength: 6,
                  autoFocus: true,
                  textInputAction: TextInputAction.go,
                  onSubmit: (code) {
                    print('submit code:$code');
                  },
                ),
                // TextField(
                //   //autofocus: true,
                //   keyboardType: TextInputType.number,
                //   maxLength: 6,
                //   maxLines: 1,
                //   minLines: 1,
                //   decoration: InputDecoration(
                //     counterText:"",//不显示长度提示字串，类似1/1
                //     enabledBorder: UnderlineInputBorder(  //未选中时下边框颜色
                //       borderSide: BorderSide(color: Colors.transparent),
                //     ),
                //     focusedBorder: UnderlineInputBorder(  //选中时下边框颜色
                //       borderSide: BorderSide(color: Colors.transparent),
                //     ),
                //     prefixIcon: Container(
                //       child: Row(
                //         children: [
                //           Padding(padding: EdgeInsets.only(left: verifyCodeInterval)),
                //           Text("test"),
                //           Padding(padding: EdgeInsets.only(left: verifyCodeInterval)),
                //         ],
                //       ),
                //     ),
                //   ),
                // )
              ],
            )
        ),
      ),
    );
  }
}