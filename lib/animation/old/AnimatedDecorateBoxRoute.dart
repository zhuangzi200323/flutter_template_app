import 'package:flutter/material.dart';
import 'package:flutter_template_app/animation/old/AnimatedDecoratedBox.dart';

class AnimatedDecorateBoxRoute extends StatefulWidget {
   const AnimatedDecorateBoxRoute({Key? key}) : super(key: key);

   @override
   _AnimatedDecorateBoxRouteState createState() => _AnimatedDecorateBoxRouteState();
 }

 class _AnimatedDecorateBoxRouteState extends State<AnimatedDecorateBoxRoute> {
   Color _decorationColor = Colors.blue;

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             AnimatedDecoratedBox(
               duration: Duration(seconds: 1),
               decoration: BoxDecoration(color: _decorationColor),
               child: ElevatedButton(
                   onPressed: () {
                     setState(() {
                       _decorationColor = _decorationColor == Colors.blue
                           ? Colors.red
                           : Colors.blue;
                     });
                   },
                   child: Text(
                     "AnimatedDecoratedBox",
                     style: TextStyle(color: Colors.white),
                   )
               ),
             ),
           ],
         ),
       ),
     );
   }
 }