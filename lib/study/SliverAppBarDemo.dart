import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('复仇者联盟'),
            background: Image.asset("resources/images/fuchou.jpg", fit: BoxFit.fitWidth,)
            // Image.network(
            //   'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
            //   fit: BoxFit.fitHeight,
            // ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((content, index) {
            return Container(
              height: 65,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 5),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 20),
        ),
        // SliverFixedExtentList(
        //   itemExtent: 80.0,
        //   delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //       return Card(
        //         child: Container(
        //           alignment: Alignment.center,
        //           color: Colors.primaries[(index % 18)],
        //           child: Text(''),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
