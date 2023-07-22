import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedListDemo();
}

class _AnimatedListDemo extends State<AnimatedListDemo>
    with SingleTickerProviderStateMixin {
  List<int> _list = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _addItem() {
    final int index = _list.length;
    _list.insert(index, index);
    _listKey.currentState!.insertItem(index);
  }

  void _removeItem() {
    final int index = _list.length - 1;
    var item = _list[index].toString();
    _listKey.currentState!.removeItem(
        index, (context, animation) => _buildItem(item, animation));
    _list.removeAt(index);
  }

  Widget _buildItem(String item, Animation animation) {
    // return SizeTransition(
    //   sizeFactor: _animation.drive(CurveTween(curve: Curves.easeIn)).drive(Tween<double>(begin: 0.0, end: 1.0)),
    //   child: Card(
    //     child: ListTile(
    //       title: Text(
    //         _item,
    //       ),
    //     ),
    //   ),
    // );
    return SlideTransition(
      position: animation.drive(CurveTween(curve: Curves.easeIn)).drive(Tween<Offset>(begin: const Offset(1,1),end: const Offset(0,0))),
      child: Card(
        child: ListTile(
          title: Text(
            item,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedListDemo"),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _list.length,
        itemBuilder: (BuildContext context, int index, Animation animation) {
          return _buildItem(_list[index].toString(), animation);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn_add",
            onPressed: () => _addItem(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 60,
          ),
          FloatingActionButton(
            heroTag: "btn_remove",
            onPressed: () => _removeItem(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
