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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("AnimationControllerDemo page"),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder:(context) {
                    //   return AnimationControllerDemo();
                    // }));
                    Navigator.of(context).push(CirclePageRoute(builder: (context) {
                      return const AnimationControllerDemo();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("AnimationTweenDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return const AnimationTweenDemo();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("AnimationCurveDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return const AnimationCurveDemo();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("AnimationMultiControllerDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return const AnimationMultiControllerDemo();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("AnimatedListDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return const AnimatedListDemo();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("CircleProgressPainter page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return const CircleProgressPainter();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("TransformDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return const TransformDemo();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("TransformDemo2 page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return const TransformDemo2();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("WaterRipplePage page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return WaterRipplePage();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("RadarPage page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return RadarPage();
                    }));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
