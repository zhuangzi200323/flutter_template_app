import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationControllerDemo extends StatefulWidget {
  const AnimationControllerDemo({Key? key}) : super(key: key);

  @override
  _AnimationControllerDemoState createState() => _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo> with SingleTickerProviderStateMixin{
  AnimationController? _controller;
  double _size = 100;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {
          _size = 100+100*_controller!.value;
        });
      })
      ..addStatusListener((status) {
        print('status=${status}');
        // if(status == AnimationStatus.completed) {
        //   _controller!.reverse();
        // }
        // if(status == AnimationStatus.dismissed) {
        //   _controller!.forward();
        // }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimationControllerDemo"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller!.forward();
          },
          child: Container(
            height: _size,
            width: _size,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text('点我变大',style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
        ),
      ),
    );
  }
}
