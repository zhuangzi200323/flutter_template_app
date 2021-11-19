import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template_app/routes/Routes.dart';
import 'package:flutter_template_app/study/MyDrawer.dart';
import 'package:flutter_template_app/themeAndLocal/CurrentLocale.dart';
import 'package:flutter_template_app/themeAndLocal/Theme.dart';
import 'package:flutter_template_app/themeAndLocal/ThemeModel.dart';
import 'package:flutter_template_app/discovery_page.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:flutter_template_app/home_page.dart';
import 'package:flutter_template_app/mine_page.dart';
import 'package:flutter_template_app/robot_page.dart';
import 'package:flutter_template_app/utils/LogUtils.dart';
import 'package:provider/provider.dart';

List<CameraDescription>? cameras;

void main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    print(cameras == null ? "0" : cameras!.length);
  } on CameraException catch (e) {
    LogUtils.logError(e.code, e.description == null ? "" : e.description!);
  }
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeModel()), //主题
        ChangeNotifierProvider(create: (context)=>CurrentLocale())//语言状态注册
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeModel, CurrentLocale>(   //主题设置1：状态获取方式
        builder: (context, themeModel, currentLocale, child) {
          return MaterialApp(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            localeListResolutionCallback: (locales, supportLocales){
              print("###" + locales.toString());
              return;
            },
            onGenerateTitle: (BuildContext context) => S.of(context).app_title,
            locale: currentLocale.value,
            theme: AppTheme.getThemeData(themeModel.value),
            home: MainPage(currentLocale: currentLocale),
            onGenerateRoute: onGenerateRoute,
          );
        });
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.currentLocale}) : super(key: key);

  CurrentLocale currentLocale;
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
      return HomePage(currentLocale: widget.currentLocale);
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
          BottomNavigationBarItem(
              icon: Image.asset('resources/images/home_n.png',
                gaplessPlayback: true,//重新加载图片的过程中，原图片的展示是否保留，解决闪一下的问题
              ),
              activeIcon: Image.asset('resources/images/home_p.png',
                gaplessPlayback: true,
              ),
              label: S.of(context).home),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: S.of(context).robot),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), label: S.of(context).discovery),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: S.of(context).mine),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        //fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      drawer: MyDrawer(), //抽屉
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(child: body),
    );
  }
}
