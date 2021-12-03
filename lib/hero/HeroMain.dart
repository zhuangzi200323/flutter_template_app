
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Main"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed("HeroAnimationRoute");
          }, child: Text("HeroAnimationRoute")),
        ],
      ),
    );
  }
}