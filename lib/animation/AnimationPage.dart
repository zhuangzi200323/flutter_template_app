import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_app/animation/TransformDemo2.dart';
import 'package:flutter_template_app/routes/CirclePageRoute.dart';

import 'AnimatedListDemo.dart';
import 'AnimationControllerDemo.dart';
import 'CircleProgressPainter.dart';
import 'RadarPage.dart';
import 'TransformDemo.dart';
import 'WaterRipplePage.dart';
import 'animation_curve_demo.dart';
import 'AnimationTweenDemo.dart';
import 'animation_mutil_controller_demo.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("AnimationControllerDemo page"),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder:(context) {
                //   return AnimationControllerDemo();
                // }));
                Navigator.of(context).push(CirclePageRoute(builder: (context) {
                  return AnimationControllerDemo();
                }));
              },
            ),
            ElevatedButton(
              child: Text("AnimationTweenDemo page"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return AnimationTweenDemo();
                }));
              },
            ),
            ElevatedButton(
              child: Text("AnimationCurveDemo page"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return AnimationCurveDemo();
                }));
              },
            ),
            ElevatedButton(
              child: Text("AnimationMultiControllerDemo page"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return AnimationMultiControllerDemo();
                }));
              },
            ),
            ElevatedButton(
              child: Text("AnimatedListDemo page"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return AnimatedListDemo();
                }));
              },
            ),
            ElevatedButton(
              child: Text("CircleProgressPainter page"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return CircleProgressPainter();
                }));
              },
            ),
            ElevatedButton(
              child: Text("TransformDemo page"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return TransformDemo();
                }));
              },
            ),
            ElevatedButton(
              child: Text("TransformDemo2 page"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return TransformDemo2();
                }));
              },
            ),
            ElevatedButton(
              child: Text("WaterRipplePage page"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return WaterRipplePage();
                }));
              },
            ),
            ElevatedButton(
              child: Text("RadarPage page"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return RadarPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
