import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DialogCheckbox.dart';

class MyDialog2 extends StatefulWidget {
  @override
  _MyDialog2State createState() {
    return _MyDialog2State();
  }
}

class _MyDialog2State extends State<MyDialog2> {
  bool withTree = false; // 复选框选中状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyDialog2"),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text("对话框2"),
            onPressed: () async {
              bool? delete = await showDeleteConfirmDialog2();
              if (delete == null) {
                print("取消删除");
              } else {
                print("同时删除子目录: $delete");
              }
            },
          ),
          ElevatedButton(
            child: Text("话框3（复选框可点击）"),
            onPressed: () async {
              //弹出删除确认对话框，等待用户确认
              bool? deleteTree = await showDeleteConfirmDialog3();
              if (deleteTree == null) {
                print("取消删除");
              } else {
                print("同时删除子目录: $deleteTree");
              }
            },
          ),
          ElevatedButton(
            child: Text("话框5（复选框可点击）"),
            onPressed: () async {
              //弹出删除确认对话框，等待用户确认
              bool? deleteTree = await showDeleteConfirmDialog5();
              if (deleteTree == null) {
                print("取消删除");
              } else {
                print("同时删除子目录: $deleteTree");
              }
            },
          ),
          ElevatedButton(
            child: Text("话框4（复选框可点击）"),
            onPressed: () async {
              //弹出删除确认对话框，等待用户确认
              bool? deleteTree = await showDeleteConfirmDialog4();
              if (deleteTree == null) {
                print("取消删除");
              } else {
                print("同时删除子目录: $deleteTree");
              }
            },
          ),
          ElevatedButton(
            child: Text("底部对话框"),
            onPressed: () async {
              //弹出删除确认对话框，等待用户确认
              int? value = await _showModalBottomSheet();
              print("onValue = " + value.toString());
            },
          ),
          ElevatedButton(
            child: Text("从底部弹出整个屏幕对话框"),
            onPressed: () {
              PersistentBottomSheetController<int> result = _showBottomSheet();
              print(result);
            },
          ),
          ElevatedButton(
            child: Text("loading dialog"),
            onPressed: () {
              showLoadingDialog();
            },
          ),
          ElevatedButton(
            child: Text("loading dialog2"),
            onPressed: () {
              showLoadingDialog2();
            },
          ),
          ElevatedButton(
            child: Text("datetime picker1"),
            onPressed: () {
              _showDatePicker1();
            },
          ),
          ElevatedButton(
            child: Text("datetime picker2"),
            onPressed: () {
              _showDatePicker2();
            },
          ),
        ],
      ),
    );
  }

  Future<bool?> showDeleteConfirmDialog2() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Checkbox(
                    value: withTree,
                    onChanged: (bool? value) {
                      //复选框选中状态发生变化时重新构建UI
                      setState(() {
                        //更新复选框状态
                        withTree = !withTree;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool?> showDeleteConfirmDialog3() {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  DialogCheckbox(
                    value: _withTree, //默认不选中
                    onChanged: (bool value) {
                      //更新选中状态
                      _withTree = !_withTree;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool?> showDeleteConfirmDialog4() {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  StatefulBuilder(
                    builder: (context, _setState) {
                      return Checkbox(
                        value: _withTree, //默认不选中
                        onChanged: (bool? value) {
                          //_setState方法实际就是该StatefulWidget的setState方法，
                          //调用后builder方法会重新被调用
                          _setState(() {
                            //更新选中状态
                            _withTree = !_withTree;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }
  Future<bool?> showDeleteConfirmDialog5() {
    bool _withTree = false;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
//                  Checkbox( // 依然使用Checkbox组件
//                    value: _withTree,
//                    onChanged: (bool value) {
//                      // 此时context为对话框UI的根Element，我们
//                      // 直接将对话框UI对应的Element标记为dirty
//                      (context as Element).markNeedsBuild();
//                      _withTree = !_withTree;
//                    },
//                  ),
                  // 通过Builder来获得构建Checkbox的`context`，
                  // 这是一种常用的缩小`context`范围的方式
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (bool? value) {
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  // 弹出底部菜单列表模态对话框
  Future<int?> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  // 返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet() {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: (){
                // do something
                print("$index");
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }

  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }

  showLoadingDialog2() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(value: .8,),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<DateTime?> _showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        Duration(days: 30),
      ),
    );
  }
  Future<DateTime?> _showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }
}