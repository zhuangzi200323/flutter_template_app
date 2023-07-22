import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_app/dialog/LoadingDialog.dart';

class MyDialog extends StatelessWidget {
  // 弹出对话框
  Future<bool?> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible:false,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            ElevatedButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> changeLanguage(BuildContext context) async {
    int? i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog(BuildContext context) async {
    int? index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        //return Dialog(child: child);
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 280),
            child: Material(
              child: child,
              type: MaterialType.card,
            ),
          ),
        );
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  Future<T?> showCustomDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    required WidgetBuilder builder,
  }) {

    // final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87, // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  void showMyDlg(BuildContext context){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Flexible(
                  child: Text("用户协议和隐私政策提示", style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Flexible(
                      child: Text("欢迎使用amy robotics"),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Flexible(
                      child:
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "在您使用Amy robotics之前，请您认真阅读并理解"),
                          TextSpan(text: "<用户协议>",
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()..onTap = () {
                            print("用户协议");
                            }),
                          TextSpan(text: "和"),
                          TextSpan(text: "<隐私政策>", style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                print("隐私政策");
                              }),
                          TextSpan(text: "。"),
                        ]
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: (){ Navigator.of(context).pop(); },
                        child: Text("拒绝"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                          backgroundColor: MaterialStateProperty.all(Colors.yellow[700]),
                        ),
                      )
                    ),
                    Expanded(child: SizedBox(), flex: 1,),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: (){ Navigator.of(context).pop(); },
                        child: Text("同意"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                          backgroundColor: MaterialStateProperty.all(Colors.green[600]),
                        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyDialog"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                child: const Text("我的对话框"),
                onPressed: () {
                  showMyDlg(context);
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                child: const Text("alert dialog" ),
                onPressed: () async {
                  //弹出对话框并等待其关闭
                  bool? delete = await showDeleteConfirmDialog1(context);
                  if (delete == null) {
                    print("取消删除");
                  } else {
                    print("已确认删除");
                  }
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                child: const Text("改变语言" ),
                onPressed: () {
                  changeLanguage(context);
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                child: const Text("show list dialog" ),
                onPressed: () {
                  showListDialog(context);
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                child: const Text("showCustomDialog" ),
                onPressed: () {
                  showCustomDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("提示"),
                        content: const Text("您确定要删除当前文件吗?"),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text("取消"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          ElevatedButton(
                            child: const Text("删除"),
                            onPressed: () {
                              // 执行删除操作
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}