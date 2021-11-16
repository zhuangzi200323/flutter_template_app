import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template_app/discovery_page.dart';
import 'package:flutter_template_app/home_page.dart';
import 'package:flutter_template_app/mine_page.dart';
import 'package:flutter_template_app/robot_page.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeListResolutionCallback: (locales, supportLocales){
        print(locales);
        return;
      },
      onGenerateTitle: (BuildContext context) => S.of(context).app_title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getPage() {
    if (selectedIndex == 0) {
      return HomePage();
    } else if (selectedIndex == 1) {
      return RobotPage();
    } else if (selectedIndex == 2) {
      return DiscoveryPage();
    } else if (selectedIndex == 3) {
      return MinePage();
    } else {
      return Text("this is a error page");
    }
  }

  @override
  Widget build(BuildContext context) {
    //final double statusBarHeight = MediaQuery.of(context).padding.top;
    //print("statusBarHeight = " + statusBarHeight.toString());
    var body = getPage();
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text(S.of(context).app_title),
        centerTitle: true,
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: selectedIndex==0 ?
          Image.asset('resources/images/home_p.png',
            gaplessPlayback: true,//重新加载图片的过程中，原图片的展示是否保留，解决闪一下的问题
          ) :
          Image.asset('resources/images/home_n.png',
            gaplessPlayback: true,
          ), label: S.of(context).home),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: S.of(context).robot),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), label: S.of(context).discovery),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: S.of(context).mine),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(child: body),
    );
  }
}
