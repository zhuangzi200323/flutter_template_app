import 'package:flutter/material.dart';
import 'package:flutter_template_app/study/LoginPage.dart';

class RobotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text("LoginPage"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return LoginPage();
                    }));
                  },
                ),
              ]
          ),
      ),
    );
  }
}