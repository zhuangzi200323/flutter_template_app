import 'package:flutter/material.dart';
import 'package:flutter_template_app/generated/l10n.dart';

class RobotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(S.of(context).robot),
      ),
    );
  }
}