import 'package:flutter/material.dart';
import 'package:flutter_template_app/animation/old/SlideTransitionX.dart';

class AnimatedSwitcherCounterRoute6 extends StatefulWidget {
   const AnimatedSwitcherCounterRoute6({Key? key}) : super(key: key);

   @override
   _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
 }

 class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute6> {
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
                 return SlideTransitionX(
                   child: child,
                   direction: AxisDirection.up,
                   position: animation,
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