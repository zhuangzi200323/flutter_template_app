import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationCurveDemo extends StatefulWidget {
  const AnimationCurveDemo({Key? key}) : super(key: key);

  @override
  _AnimationCurveDemoState createState() => _AnimationCurveDemoState();
}

class _AnimationCurveDemoState extends State<AnimationCurveDemo> with SingleTickerProviderStateMixin{
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        print('status=${status}');
      });
    _animation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: Curves.bounceIn))
        .animate(_controller!);
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
        title: const Text("AnimationCurveDemo"),
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
            height: _animation!.value,
            width: _animation!.value,
            color: Colors.green,
            alignment: Alignment.center,
            child: Text('点我变大',style: TextStyle(color: Colors.white, fontSize: 18),),
          ),
        ),
      ),
    );
  }
}
