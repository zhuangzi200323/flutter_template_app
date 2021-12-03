import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute4 extends StatefulWidget {
   const AnimatedSwitcherCounterRoute4({Key? key}) : super(key: key);

   @override
   _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
 }

 class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute4> {
   int _count = 0;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             AnimatedSwitcher(
               duration: const Duration(milliseconds: 500),
               transitionBuilder: (Widget child, Animation<double> animation) {
                 var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                 return MySlideTransition(
                   child: child,
                   position: tween.animate(animation),
                 );
               },
               child: Text(
                 '$_count',
                 //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                 key: ValueKey<int>(_count),
                 style: Theme.of(context).textTheme.headline4,
               ),
             ),
             RaisedButton(
               child: const Text('+1',),
               onPressed: () {
                 setState(() {
                   _count += 1;
                 });
               },
             ),
           ],
         ),
       ),
     );
   }
 }

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key? key,
    required Animation<Offset> position,
    this.transformHitTests = true,
    required this.child,
  })
      : assert(position != null),
        super(key: key, listenable: position) ;

  Animation<Offset> get position => listenable as Animation<Offset>;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset=position.value;
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}