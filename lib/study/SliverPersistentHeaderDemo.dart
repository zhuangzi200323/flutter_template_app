import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverPersistentHeaderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverPersistentHeaderDemo"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 20),
          )
        ],
      ),
    );
  }
}
class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text('我是一个SliverPersistentHeader',
            style: TextStyle(color: Colors.white)));
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 如果内容需要更新，设置为true
}
