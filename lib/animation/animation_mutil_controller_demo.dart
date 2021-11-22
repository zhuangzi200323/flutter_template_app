import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationMultiControllerDemo  extends StatefulWidget {
  const AnimationMultiControllerDemo ({Key? key}) : super(key: key);

  @override
  _AnimationMultiControllerDemoDemoState createState() => _AnimationMultiControllerDemoDemoState();
}

class _AnimationMultiControllerDemoDemoState extends State<AnimationMultiControllerDemo> with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late AnimationController _colorController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _sizeController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    _sizeAnimation = _sizeController
        .drive(CurveTween(curve: Curves.linear))
        .drive(Tween(begin: 100.0, end: 200.0));

    _colorController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    _colorAnimation = _colorController
        .drive(CurveTween(curve: Curves.easeIn))
        .drive(ColorTween(begin: Colors.blue, end: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _sizeController.forward();
            _colorController.forward();
          },
          child: Container(
            height: _sizeAnimation.value,
            width: _sizeAnimation.value,
            color: _colorAnimation.value,
            alignment: Alignment.center,
            child: Text(
              '点我变化',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _sizeController.dispose();
    _colorController.dispose();
  }
}
