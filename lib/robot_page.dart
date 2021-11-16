import 'package:flutter/material.dart';
import 'package:flutter_template_app/LoginPage.dart';
import 'package:flutter_template_app/generated/l10n.dart';

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