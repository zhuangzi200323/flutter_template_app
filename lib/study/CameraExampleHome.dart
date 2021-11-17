

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CameraExampleHome extends StatefulWidget {
  @override
  _CameraExampleHomeState createState() => _CameraExampleHomeState();
}

class _CameraExampleHomeState extends State<CameraExampleHome> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    if (controller != null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );
  }
}