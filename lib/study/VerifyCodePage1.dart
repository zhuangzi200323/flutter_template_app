import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:flutter_template_app/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyCodePage1 extends StatefulWidget {
  @override
  _VerifyCodePageState createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage1> {
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
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(left: verifyCodeInterval)),
                    SizedBox(
                      child: getVerifyCodeTextField(0, keyboardFocusNode1, null, verifyCodeFocusNode1, verifyCodeFocusNode2),
                      width: verifyCodeTextFieldWH,
                      height: verifyCodeTextFieldWH,
                    ),
                    Padding(padding: EdgeInsets.only(left: verifyCodeInterval)),
                    SizedBox(
                      child: getVerifyCodeTextField(1, keyboardFocusNode2, verifyCodeFocusNode1, verifyCodeFocusNode2, verifyCodeFocusNode3),
                      width: verifyCodeTextFieldWH,
                      height: verifyCodeTextFieldWH,
                    ),
                    Padding(padding: EdgeInsets.only(left: verifyCodeInterval)),
                    SizedBox(
                      child: getVerifyCodeTextField(2, keyboardFocusNode3, verifyCodeFocusNode2, verifyCodeFocusNode3, verifyCodeFocusNode4),
                      width: verifyCodeTextFieldWH,
                      height: verifyCodeTextFieldWH,
                    ),
                    Padding(padding: EdgeInsets.only(left: verifyCodeInterval)),
                    SizedBox(
                      child: getVerifyCodeTextField(3, keyboardFocusNode4, verifyCodeFocusNode3, verifyCodeFocusNode4, verifyCodeFocusNode5),
                      width: verifyCodeTextFieldWH, height: verifyCodeTextFieldWH,
                    ),
                    Padding(padding: EdgeInsets.only(left: verifyCodeInterval)),
                    SizedBox(
                      child: getVerifyCodeTextField(4, keyboardFocusNode5, verifyCodeFocusNode4, verifyCodeFocusNode5, verifyCodeFocusNode6),
                      width: verifyCodeTextFieldWH,
                      height: verifyCodeTextFieldWH,
                    ),
                    Padding(padding: EdgeInsets.only(left: verifyCodeInterval)),
                    SizedBox(
                      child: getVerifyCodeTextField(5, keyboardFocusNode6, verifyCodeFocusNode5, verifyCodeFocusNode6, null),
                      width: verifyCodeTextFieldWH,
                      height: verifyCodeTextFieldWH,
                    ),
                    Padding(padding: EdgeInsets.only(left: verifyCodeInterval)),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

  InputDecoration getDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.only(top: 0, bottom: 0),
      fillColor: Colors.grey[400],
      filled: true,
      counterText:"",//不显示长度提示字串，类似1/1
      enabledBorder: OutlineInputBorder( //未选中时候的颜色
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: Colors.grey,),
      ),
      focusedBorder: OutlineInputBorder( //选中时外边框颜色
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: Colors.green,),
      ),
    );
  }

  TextField getVerifyCodeTextField(int index, FocusNode keyboardFocusNode, FocusNode? preFocusNode, FocusNode focusNode, FocusNode? nextFocusNode) {
    return TextField(
      focusNode: focusNode,
      onChanged: (value) {
        if(value.length >= 1){
          verifyCode[index] = value;
          if(nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else { //去检查验证码
            FocusScope.of(context).requestFocus(blankNode);
            print("verify code = " + verifyCode.toString());
          }
        } else {
          verifyCode[index] = "";
          if(preFocusNode != null) {
            FocusScope.of(context).requestFocus(preFocusNode);
          } else {
            print("verify code = " + verifyCode.toString());
          }
        }
      },
      // controller: TextEditingController.fromValue(TextEditingValue(
      //     text: verifyCode[index],  //判断keyword是否为空
      //     // 保持光标在最后
      //     selection: TextSelection.fromPosition(TextPosition(
      //         affinity: TextAffinity.downstream,
      //         offset: verifyCode[index].length)))
      // ),
      textAlign: TextAlign.center,//与contentPadding一起搭配可以实现水平垂直居中
      //cursorWidth: 0,
      //cursorHeight: 0,
      maxLength: 1,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLines: 1,
      minLines: 1,
      keyboardType: TextInputType.number,
      decoration: getDecoration(),
    );
  }
}