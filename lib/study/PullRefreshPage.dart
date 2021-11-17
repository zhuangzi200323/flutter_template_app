import 'package:flutter/material.dart';

class PullRefreshPage extends StatefulWidget {
  @override
  _PullRefreshPageState createState() => _PullRefreshPageState();
}

class _PullRefreshPageState extends State<PullRefreshPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("refresh"),
      ),
      body: RefreshIndicator(
        onRefresh: () async  {
          print("onRefresh");
          await Future.delayed(Duration(seconds: 1));
          return Future.value(true);
        },
        child: ListView(
          children: [
          ],
        ),
      ),
    );
  }
}
