import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_template_app/generated/json/author2_entity_helper.dart';
import 'package:flutter_template_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:flutter_template_app/json/Author.dart';
import 'package:flutter_template_app/json/author2_entity.dart';
import 'package:flutter_template_app/themeAndLocal/CurrentLocale.dart';
import 'package:flutter_template_app/themeAndLocal/ThemeModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.currentLocale}) : super(key: key);

  CurrentLocale currentLocale;

  @override
  _HomePageState createState() => _HomePageState();
}

Locale preLocale;
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<TabTitle> tabList;
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  initTabData() {
    tabList = [
      new TabTitle(S.of(context).recommend, 0),
      new TabTitle(S.of(context).social, 1),
      new TabTitle(S.of(context).entertainment, 2),
      new TabTitle(S.of(context).sport, 3),
      new TabTitle(S.of(context).article, 4),
      new TabTitle(S.of(context).tech, 5),
      new TabTitle(S.of(context).finance, 6),
      new TabTitle(S.of(context).fishion, 7),
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
    if(tabList == null || tabList.isEmpty || preLocale != widget.currentLocale.value) {
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
    Author2Entity fromJsonAsT = JsonConvert.fromJsonAsT<Author2Entity>(jsonMap);
    Author author = Author.fromJson(jsonMap);

    if(controller == null){
      controller = TabController(
        initialIndex: selectIndex,
        length: tabList.length,
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
                //??????????????????
                controller: controller,
                labelColor: Colors.red,
                unselectedLabelColor: Color(0xff666666),
                labelStyle: TextStyle(fontSize: 16.0),
                tabs: tabList.map((item) {
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
                children: tabList.map((item) {
                  return Scrollbar(
                    child: ListView(
                      children: [
                        Text(item.title, textAlign: TextAlign.center,),
                        Column(
                          children: [
                            Text(S.of(context).get_email_verify_code),
                            Text(S.of(context).new_user_register),
                            Text(S.of(context).password_hint),
                          ],
                        ),
                      ],
                    ),
                  );
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

  TabTitle(this.title, this.id);
}
