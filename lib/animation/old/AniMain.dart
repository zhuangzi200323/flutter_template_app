
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AniMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animate Main"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AniOpacity");
            }, child: Text("AniOpacity")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AniScale");
            }, child: Text("AniScale")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AniScale2");
            }, child: Text("AniScale2")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AniScale3");
            }, child: Text("AniScale3")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AniGrowTransition");
            }, child: Text("AniGrowTransition")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("StaggerRoute");
            }, child: Text("StaggerRoute")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedSwitcherCounterRoute");
            }, child: Text("AnimatedSwitcherCounterRoute")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedSwitcherCounterRoute2");
            }, child: Text("AnimatedSwitcherCounterRoute2")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedSwitcherCounterRoute3");
            }, child: Text("AnimatedSwitcherCounterRoute3")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedSwitcherCounterRoute4");
            }, child: Text("AnimatedSwitcherCounterRoute4")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedSwitcherCounterRoute5");
            }, child: Text("AnimatedSwitcherCounterRoute5")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedSwitcherCounterRoute6");
            }, child: Text("AnimatedSwitcherCounterRoute6")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedSwitcherCounterRoute7");
            }, child: Text("AnimatedSwitcherCounterRoute7")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedSwitcherCounterRoute8");
            }, child: Text("AnimatedSwitcherCounterRoute8")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedDecorateBoxRoute");
            }, child: Text("AnimatedDecorateBoxRoute")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("AnimatedWidgetsTest");
            }, child: Text("AnimatedWidgetsTest")),
          ],
        ),
      ),
    );
  }
}