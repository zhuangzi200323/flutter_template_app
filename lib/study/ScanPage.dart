import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:flutter_template_app/utils/Utils.dart';
import 'package:scan/scan.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  ScanController controller = ScanController();
  int _index = 0;
  TextEditingController? textEditController;

  @override
  void initState() {
    super.initState();
    textEditController = new TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text("scan"),
      // ),
      body: Stack(
        children: [
          _index == 0 ? showScanUi() : showManualInputUi(),
          Positioned(
            top: MediaQuery.of(context).padding.top + 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top:10),
              child: Text(_index == 0 ? S.of(context).scan_code : S.of(context).manual_input,
                style: TextStyle(fontSize: 16, color: _index == 0 ? Colors.white : Colors.black87), textAlign: TextAlign.center,),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 5,
            child: Row(
              children: [
                SizedBox(width: 10),
                IconButton(icon: Icon(Icons.arrow_back_ios, color: _index == 0 ? Colors.white : Colors.black87,),
                  onPressed: (){ Navigator.of(context).pop(); },),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              width: MediaQuery.of(context).size.width,
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      print("test");
                      if(_index != 0) {
                        controller.resume();
                        setState(() {
                          _index = 0;
                        });
                      }
                    },
                    child: Column(
                      children: [
                        Image.asset("resources/images/logo.png", height: 80,),
                        Text(S.of(context).scan_code, style: TextStyle(color: _index == 0 ? Colors.green : Colors.white),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("test1");
                      controller.pause();
                      setState(() {
                        _index = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset("resources/images/logo.png", height: 80,),
                        Text(S.of(context).manual_input, style: TextStyle(color: _index == 1 ? Colors.green : Colors.white),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showManualInputUi() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 60,),
          Text(S.of(context).pls_input_robot_recognize_code),
          SizedBox(height: 20,),
          TextField(
            cursorColor: Colors.green,
            //autofocus: false,
            controller: textEditController,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              //mailTextEditValueChange(value);
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              hintText: S.of(context).char_and_num_code,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.pink),
              ),
              focusedBorder: OutlineInputBorder(  //选中时下边框颜色
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            child: Ink(
              height: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.green[800]!, Colors.green[500]!]),
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(S.of(context).ok, textAlign: TextAlign.center,
                        style: TextStyle(
                          //backgroundColor: Colors.red,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  if(textEditController!.text.isEmpty){
                    showToast(S.of(context).pls_input_robot_recognize_code);
                  } else {
                    showToast(textEditController!.text);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showScanUi() {
    return Stack(
      children: [
        ScanView(
          controller: controller,
          scanAreaScale: .7,
          scanLineColor: Colors.green,
          onCapture: (data) {
            print("#### ${data}");
            if(data != null && data.isNotEmpty && data.startsWith("AM00T") && data.length == 15){
              showToast(data);
            } else {
              showErrorDlg();
            }
          },
        ),
        Positioned(
          bottom: 150,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).recognize_code_scan_hint, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                ]
            ),
          ),
        ),
      ],
    );
  }

  Future<bool?> showErrorDlg() async {
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Column(
              children: [
                Text(S.of(context).recognize_fail, style: TextStyle(fontWeight: FontWeight.w700),),
                SizedBox(height: 10,),
                Text(S.of(context).pls_scan_right_recognize_code),
              ],
            ),
            //title: Text(S.of(context).recognize_fail),
            //content: Text(S.of(context).pls_scan_right_recognize_code),
            actions: <Widget>[
              CupertinoDialogAction(child: Text(S.of(context).retry),
                onPressed: (){
                  controller.resume();
                  Navigator.pop(context, false);
                },),
              CupertinoDialogAction(child: Text(S.of(context).back),
                onPressed: (){
                  Navigator.pop(context, false);
                  Navigator.pop(context, false);
                },),
            ],
          );
        });
  }
}
