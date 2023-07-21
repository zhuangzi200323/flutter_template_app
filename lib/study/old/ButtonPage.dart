import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Button Page"),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
                  child: Text("我是 RaiseButton" ),
                  onPressed: () {},
              ),
          TextButton(
                  child: Text("我是 FlatButton" ),
                  // color: Colors.blue,
                  onPressed: () {},
              ),
              OutlinedButton(
                  child: Text("我是 OutlineButton"),
                  // textColor: Colors.blue,
                  onPressed: () {},
              ),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
              )  
        ]
      )
    );
  }
}