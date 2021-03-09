import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<TabTitle> tabList;
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  initTabData() {
    tabList = [
      new TabTitle(AppLocalizations.of(context).recommend, 0),
      new TabTitle(AppLocalizations.of(context).social, 1),
      new TabTitle(AppLocalizations.of(context).entertainment, 2),
      new TabTitle(AppLocalizations.of(context).sport, 3),
      new TabTitle(AppLocalizations.of(context).article, 4),
      new TabTitle(AppLocalizations.of(context).tech, 5),
      new TabTitle(AppLocalizations.of(context).finance, 6),
      new TabTitle(AppLocalizations.of(context).fishion, 7),
    ];
  }

  void _onTap(int index){
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(tabList == null || tabList.isEmpty) {
      initTabData();
    }
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
                //是否可以滚动
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
                  return Center(
                    child: Text(item.title),
                  );
                }).toList(),
              ),
            )
          ],
        ));
  }
}

class TabTitle {
  String title;
  int id;

  TabTitle(this.title, this.id);
}
