import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute3 extends StatefulWidget {
   const AnimatedSwitcherCounterRoute3({Key? key}) : super(key: key);

   @override
   _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
 }

 class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute3> {
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
                 return SlideTransition(
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