import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_app/widget/TestImageView.dart';
import 'dart:ui' as ui;

class CustomizePage extends StatefulWidget {
  @override
  _CustomizePageState createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  ui.Image? image1;
  double left = 0, top = 0;
  double scale = 1.0, rotation = 0;

  Offset downPosition = Offset.zero;
  double downScale = 0, downRotation = 0;
  double fingerCenterX = 0, fingerCenterY = 0;

  @override
  void initState() {
    loadImage("resources/images/test.jpg", false)
        .then((value)  {
      image1 = value;
      setState(() {});
    });
    super.initState();
  }

  onScaleStart(ScaleStartDetails details) {
    // print("@@@@@@@@@@@@@@@onScaleStart => ${details}");
    downPosition = details.focalPoint;
    downScale = 1.0;
    downRotation = 0;
  }

  onScaleUpdate(ScaleUpdateDetails details) {
    // print("@@@@@@@@@@@@@@@ => scale=${scale}, rotation=${rotation}, ${details.focalPoint}");
    if(details.pointerCount > 1) {
      setState(() {
        scale += details.scale - downScale;
        downScale = details.scale;

        rotation += details.rotation - downRotation;
        downRotation = details.rotation;

        fingerCenterX = details.focalPoint.dx;
        fingerCenterY = details.focalPoint.dy;
      });
    } else {
      setState(() {
        // left += (details.focalPoint.dx - downPosition.dx)/scale;
        // top += (details.focalPoint.dy - downPosition.dy)/scale;
        left += details.focalPoint.dx - downPosition.dx;
        top += details.focalPoint.dy - downPosition.dy;
        downPosition = details.focalPoint;
        fingerCenterX = details.focalPoint.dx;
        fingerCenterY = details.focalPoint.dy;
      });
    }
  }

  onScaleEnd(ScaleEndDetails details) {
    print("@@@@@@@@@@@@@@@ => left=${left}, top=${top}");
    // print("@@@@@@@@@@@@@@@ScaleEndDetails => ${details}");
  }

  @override
  Widget build(BuildContext context) {
    if (image1 == null) {
      return Container();
    }
    //print("${MediaQuery.of(context).size}");
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("CustomizePage"),
      // ),
      body: Container(
        child: GestureDetector(
          onScaleStart: (details) => onScaleStart(details),
          onScaleUpdate: (details) => onScaleUpdate(details),
          onScaleEnd: (details) => onScaleEnd(details),
          child: CustomPaint(
            painter: TestImageView(image1!, left: left, top: top, scale: scale, rotation: rotation,
                centerX: fingerCenterX, centerY: fingerCenterY),
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
          ),
        ),
      ),
    );
  }

  // 获取图片 本地为false 网络为true
  Future<ui.Image> loadImage(var path, bool isUrl) async {
    ImageStream stream;
    if (isUrl) {
      stream = NetworkImage(path).resolve(ImageConfiguration.empty);
    } else {
      stream =
          AssetImage(path, bundle: rootBundle).resolve(ImageConfiguration.empty);
    }
    Completer<ui.Image> completer = Completer<ui.Image>();
    void listener(ImageInfo frame, bool synchronousCall) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(ImageStreamListener(listener));
    }

    stream.addListener(ImageStreamListener(listener));
    return completer.future;
  }
}
