
import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({required this.child, required this.animation});

  final Widget child;
  final Animation<double> animation;
    
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return new Container(
                height: animation.value, 
                width: animation.value, 
                child: child
            );
          },
          child: child
      ),
    );
  }
}