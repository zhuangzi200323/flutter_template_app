import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_template_app/animation/AnimationPage.dart';
import 'package:flutter_template_app/themeAndLocal/CurrentLocale.dart';
import 'package:flutter_template_app/themeAndLocal/ThemeModel.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'OldStudyPage.dart';
import 'generated/json/base/json_convert_content.dart';
import 'json/Author.dart';
import 'json/author2_entity.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.currentLocale}) : super(key: key);

  CurrentLocale currentLocale;
  @override
  _HomePageState createState() => _HomePageState();
}

Locale? preLocale;
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  List<TabTitle>? tabList;
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  initTabData() {
    tabList = [
      TabTitle(S.of(context).recommend, 0, const AnimationPage()),
      TabTitle("Old study", 1, const OldStudyPage()),
      TabTitle(S.of(context).entertainment, 2, const AnimationPage()),
      TabTitle(S.of(context).sport, 3, const AnimationPage()),
      TabTitle(S.of(context).article, 4, const AnimationPage()),
      TabTitle(S.of(context).tech, 5, const AnimationPage()),
      TabTitle(S.of(context).finance, 6, const AnimationPage()),
      TabTitle(S.of(context).fishion, 7, const AnimationPage()),
    ];
  }

  void _onTap(int index){
    setState(() {
      selectIndex = index;
    });
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    if(tabList == null || tabList!.isEmpty || preLocale != widget.currentLocale.value) {
      preLocale = widget.currentLocale.value;
      initTabData();
      print("initTabData");
    }
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> jsonMap = json.decode('{\"name\": \"jack\",\"title\": \"test\",\"id\": 2}');
    Author2Entity author2entity = JsonConvert.fromJsonAsT<Author2Entity>(jsonMap);
    Author author = Author.fromJson(jsonMap);

    if(controller == null){
      controller = TabController(
        initialIndex: selectIndex,
        length: tabList!.length,
        vsync: this,
      );
    }
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              color: new Color(0xfff4f5f6),
              height: 38.0,
              child: TabBar(
                isScrollable: true,
                //是否可以滚动
                controller: controller,
                labelColor: Colors.red,
                unselectedLabelColor: Color(0xff666666),
                labelStyle: TextStyle(fontSize: 16.0),
                tabs: tabList!.map((item) {
                  return Tab(
                    text: item.title,
                  );
                }).toList(),
                onTap: _onTap,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: tabList!.map((item) {
                  return item.widget;
                  // return Scrollbar(
                  //   child: ListView(
                  //     children: [
                  //       Text(item.title, textAlign: TextAlign.center,),
                  //       Column(
                  //         children: [
                  //           Text(S.of(context).get_email_verify_code),
                  //           Text(S.of(context).new_user_register),
                  //           Text(S.of(context).password_hint),
                  //           Text(author2entity.name == null ? "json parse error" : author2entity.name!),
                  //           Text(author.title == null ? "json parse error" : author.title!),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // );
                }).toList(),
              ),
            )
          ],
        )
    );
  }
}

class TabTitle {
  String title;
  int id;
  Widget widget;

  TabTitle(this.title, this.id, this.widget);
}
