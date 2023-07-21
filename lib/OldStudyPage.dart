import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_app/study/LoginPage.dart';
import 'package:flutter_template_app/study/old/ListPage.dart';

class OldStudyPage extends StatefulWidget {
  const OldStudyPage({Key? key}) : super(key: key);
  @override
  _OldStudyPageState createState() => _OldStudyPageState();
}

class _OldStudyPageState extends State<OldStudyPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Old study"),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context){
              // 在Widget树中向上查找最近的父级`Scaffold` widget
              Scaffold? scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
              // 直接返回 AppBar的title， 此处实际上是Text("Old study")
              //return (scaffold!.appBar as AppBar).title!;
              return Text("Old study");
            },),
            ElevatedButton(
              //color: Colors.blue,
              //highlightColor: Colors.blue[700],
              //colorBrightness: Brightness.dark,
              //splashColor: Colors.grey,
              child: Text("Submit"),
              //shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.accessible,color: Colors.green,),
                Icon(Icons.error,color: Colors.green,),
                Icon(Icons.fingerprint,color: Colors.green,),
              ],
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("这是一个测试")));
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return ListPage();
                }, fullscreenDialog: false));
              },
              child: Text("ListPage"),
            ),
            ElevatedButton(
              child: Text("Click to ListPage" ),
              onPressed: () {
                Navigator.pushNamed(context, "ListPage");
              },
            ),
            ElevatedButton(
              child: Text("Click to Page2" ),
              onPressed: () {
                Navigator.pushNamed(context, "Page2", arguments: "hi jack");
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder:(context) {
                //   return LoginPage();
                // }));
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                    pageBuilder: (BuildContext context, Animation<double> animation,
                        Animation secondaryAnimation) {
                      return new FadeTransition(
                        //使用渐隐渐入过渡,
                        opacity: animation,
                        child: LoginPage(), //路由B
                      );
                    },
                  ),
                );
              },
              child: Text("LoginPage"),
            ),
            ElevatedButton(
              child: Text("Button page" ),
              onPressed: () {
                Navigator.pushNamed(context, "ButtonPage");
              },
            ),
            ElevatedButton(
              child: Text("AnimateMain" ),
              onPressed: () {
                Navigator.pushNamed(context, "AnimateMain");
              },
            ),
            ElevatedButton(
              child: Text("HeroMain" ),
              onPressed: () {
                Navigator.pushNamed(context, "HeroMain");
              },
            ),
            ElevatedButton(
              child: Text("FlexPage page" ),
              onPressed: () {
                Navigator.pushNamed(context, "FlexPage");
              },
            ),
            ElevatedButton(
              child: Text("AnimatePage2" ),
              onPressed: () {
                Navigator.pushNamed(context, "AnimatePage2");
              },
            ),
            ElevatedButton(
              child: Text("HttpTestPage" ),
              onPressed: () {
                Navigator.pushNamed(context, "HttpTestPage");
              },
            ),
            ElevatedButton(
              child: Text("FutureBuilderPage" ),
              onPressed: () {
                Navigator.pushNamed(context, "FutureBuilderPage");
              },
            ),
            ElevatedButton(
              child: Text("SnackBarPage" ),
              onPressed: () {
                Navigator.pushNamed(context, "SnackBarPage");
              },
            ),
            ElevatedButton(
              child: Text("SwitchAndCheckBoxTestRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "SwitchAndCheckBoxTestRoute");
              },
            ),
            ElevatedButton(
              child: Text("FocusTestRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "FocusTestRoute");
              },
            ),
            ElevatedButton(
              child: Text("ProgressRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "ProgressRoute");
              },
            ),
            ElevatedButton(
              child: Text("ScaffoldRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "ScaffoldRoute");
              },
            ),
            ElevatedButton(
              child: Text("SingleChildScrollViewTestRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "SingleChildScrollViewTestRoute");
              },
            ),
            ElevatedButton(
              child: Text("Listview" ),
              onPressed: () {
                Navigator.pushNamed(context, "Listview");
              },
            ),
            ElevatedButton(
              child: Text("Listview2" ),
              onPressed: () {
                Navigator.pushNamed(context, "Listview2");
              },
            ),
            ElevatedButton(
              child: Text("Listview3" ),
              onPressed: () {
                Navigator.pushNamed(context, "Listview3");
              },
            ),
            ElevatedButton(
              child: Text("InfiniteListView" ),
              onPressed: () {
                Navigator.pushNamed(context, "InfiniteListView");
              },
            ),
            ElevatedButton(
              child: Text("ListviewWithHead" ),
              onPressed: () {
                Navigator.pushNamed(context, "ListviewWithHead");
              },
            ),
            ElevatedButton(
              child: Text("InfiniteGridView" ),
              onPressed: () {
                Navigator.pushNamed(context, "InfiniteGridView");
              },
            ),
            ElevatedButton(
              child: Text("CustomScrollViewTestRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "CustomScrollViewTestRoute");
              },
            ),
            ElevatedButton(
              child: Text("ScrollControllerTestRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "ScrollControllerTestRoute");
              },
            ),
            ElevatedButton(
              child: Text("ScrollNotificationTestRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "ScrollNotificationTestRoute");
              },
            ),
            ElevatedButton(
              child: Text("WillPopScopeTestRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "WillPopScopeTestRoute");
              },
            ),
            ElevatedButton(
              child: Text("InheritedWidgetTestRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "InheritedWidgetTestRoute");
              },
            ),
            ElevatedButton(
              child: Text("ProviderRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "ProviderRoute");
              },
            ),
            ElevatedButton(
              child: Text("ThemeTestRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "ThemeTestRoute");
              },
            ),
            ElevatedButton(
              child: Text("StreamBuilderPage" ),
              onPressed: () {
                Navigator.pushNamed(context, "StreamBuilderPage");
              },
            ),
            ElevatedButton(
              child: Text("MyDialog" ),
              onPressed: () {
                //��������·������ת
                Navigator.pushNamed(context, "MyDialog");
              },
            ),
            ElevatedButton(
              child: Text("MyDialog2" ),
              onPressed: () {
                //��������·������ת
                Navigator.pushNamed(context, "MyDialog2");
              },
            ),
            ElevatedButton(
              child: Text("GradientButtonRoute" ),
              onPressed: () {
                //��������·������ת
                Navigator.pushNamed(context, "GradientButtonRoute");
              },
            ),
            ElevatedButton(
              child: Text("FileOperationRoute" ),
              onPressed: () {
                //��������·������ת
                Navigator.pushNamed(context, "FileOperationRoute");
              },
            ),
            ElevatedButton(
              child: Text("PathProviderStudy" ),
              onPressed: () {
                Navigator.pushNamed(context, "PathProviderStudy");
              },
            ),
            ElevatedButton(
              child: Text("DioStudy" ),
              onPressed: () {
                Navigator.pushNamed(context, "DioStudy");
              },
            ),
            ElevatedButton(
              child: Text("WebSocketRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "WebSocketRoute");
              },
            ),
            ElevatedButton(
              child: Text("CameraRoute" ),
              onPressed: () {
                Navigator.pushNamed(context, "CameraRoute");
              },
            ),
          ],
        ),
      ),
    );
  }
}
