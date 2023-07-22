import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationTweenDemo extends StatefulWidget {
  const AnimationTweenDemo({Key? key}) : super(key: key);

  @override
  _AnimationTweenDemoState createState() => _AnimationTweenDemoState();
}

class _AnimationTweenDemoState extends State<AnimationTweenDemo> with SingleTickerProviderStateMixin{
  AnimationController? _controller;
  Animation<Color?>? _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        print('status=${status}');
      });
    _animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(_controller!);
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
        title: const Text("AnimationTweenDemo"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (_controller!.status == AnimationStatus.completed) {
              _controller!.reverse();
            } else {
              _controller!.forward();
            }
          },
          child: Container(
            height: 100,
            width: 100,
            color: _animation!.value,
            alignment: Alignment.center,
            child: const Text('点我变色',style: TextStyle(color: Colors.white, fontSize: 18),),
          ),
        ),
      ),
    );
  }
}
