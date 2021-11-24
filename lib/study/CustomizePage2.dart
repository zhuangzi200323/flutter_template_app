import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_app/widget/TestImageView.dart';
import 'dart:ui' as ui;

import 'package:flutter_template_app/widget/TestImageView2.dart';

class CustomizePage2 extends StatefulWidget {
  @override
  _CustomizePageState createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage2> {
  ui.Image? image1;
  double left = 0, top = 0;
  double initScale = 1.0, scale = 1.0, rotation = 0;

  Offset downPosition = Offset.zero;
  double downScale = 0, downRotation = 0;
  double fingerCenterX = 0, fingerCenterY = 0;

  Offset originPosition = Offset.zero;

  Matrix4 matrix4 = Matrix4.identity();

  @override
  void initState() {
    loadImage("resources/images/testw.jpg", false)
        .then((value)  {
      image1 = value;
      double hScale = MediaQuery.of(context).size.height/image1!.height;
      double wScale = MediaQuery.of(context).size.width/image1!.width;
      initScale = hScale < wScale ? hScale : wScale;
      scale = initScale;
      left = (MediaQuery.of(context).size.width - image1!.width*initScale)/2;
      top = (MediaQuery.of(context).size.height - image1!.height*initScale)/2;
      setState(() {});
    });
    super.initState();
  }

  onScaleStart(ScaleStartDetails details) {
    print("@@@@@@@@@@@@@@@onScaleStart => ${details}");
    downPosition = details.focalPoint;
    downScale = 1.0;
    downRotation = 0;
  }

  onScaleUpdate(ScaleUpdateDetails details) {
    // if(details.focalPoint.dx > left && details.focalPoint.dy > top &&
    //     details.focalPoint.dx < left + image1!.width*scale && details.focalPoint.dy < top + image1!.height*scale) {}
    print("@@@@@@@@@@@@@@@ => scale=${scale}, rotation=${rotation}, ${details.focalPoint}, left => ${left}, top => ${top}, size=${MediaQuery.of(context).size}");
    if (details.pointerCount > 1) {
      scale += details.scale - downScale;
      downScale = details.scale;

      rotation += details.rotation - downRotation;
      downRotation = details.rotation;

      originPosition = Offset(details.focalPoint.dx-left, details.focalPoint.dy-top);
      fingerCenterX = details.focalPoint.dx;
      fingerCenterY = details.focalPoint.dy;

    } else {
      left += details.focalPoint.dx - downPosition.dx;
      top += details.focalPoint.dy - downPosition.dy;

      downPosition = details.focalPoint;
      fingerCenterX = details.focalPoint.dx;
      fingerCenterY = details.focalPoint.dy;
    }
    // //图片宽小于等于窗口宽时，保证图片左边界在窗口左边界内
    // if(image1!.width*scale <= MediaQuery.of(context).size.width && left <= 0) {
    //   left = 0;
    // }
    // //图片宽小于等于窗口宽时，保证图片右边界在窗口右边界内
    // if(image1!.width*scale <= MediaQuery.of(context).size.width && left >= (MediaQuery.of(context).size.width - image1!.width*scale)) {
    //   left = MediaQuery.of(context).size.width - image1!.width*scale;
    // }
    // //图片宽大于窗口宽时，保证图片左边界在窗口左边界内
    // if(image1!.width*scale > MediaQuery.of(context).size.width && left >= 0) {
    //   left = 0;
    // }
    // //图片宽大于窗口宽时，保证图片右边界在窗口右边界内
    // if(image1!.width*scale > MediaQuery.of(context).size.width && left <= (MediaQuery.of(context).size.width - image1!.width*scale)) {
    //   left = MediaQuery.of(context).size.width - image1!.width*scale;
    // }

    // //图片高小于等于窗口高时，保证图片上边界在窗口上边界内
    // if(image1!.height*scale <= MediaQuery.of(context).size.height && top <= 0) {
    //   top = 0;
    // }
    // //图片高小于等于窗口高时，保证图片下边界在窗口下边界内
    // if(image1!.height*scale <= MediaQuery.of(context).size.height && top >= (MediaQuery.of(context).size.height - image1!.height*scale)) {
    //   top = MediaQuery.of(context).size.height - image1!.height*scale;
    // }
    // //图片高大于窗口高时，保证图片上边界在窗口上边界内，也就是top=0
    // if(image1!.height*scale > MediaQuery.of(context).size.height && top >= 0) {
    //   top = 0;
    // }
    // //图片高大于窗口高时，保证图片下边界在窗口下边界内
    // if(image1!.height*scale > MediaQuery.of(context).size.height && top <= (MediaQuery.of(context).size.height - image1!.height*scale)) {
    //   top = MediaQuery.of(context).size.height - image1!.height*scale;
    // }

    setState(() {});
  }

  onScaleEnd(ScaleEndDetails details) {
    print("@@@@@@@@@@@@@@@ => left=${left}, top=${top}");
    // print("@@@@@@@@@@@@@@@ScaleEndDetails => ${details}");
    if (scale < initScale) {
      setState(() {
        scale = initScale;
      });
    } else if (scale > 2.0) {
      setState(() {
        scale = 2.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (image1 == null) {
      return Container();
    }
    matrix4 = Matrix4.identity();
    matrix4.translate(left, top, 0);
    matrix4.scale(scale);
    matrix4.rotateZ(rotation);
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            alignment: Alignment.topLeft,
            child: Transform(
              origin: Offset(0, 0),
              transform: matrix4,
              child: CustomPaint(
                painter: TestImageView2(image1!, left: left, top: top, scale: scale, rotation: rotation,
                    centerX: fingerCenterX, centerY: fingerCenterY),
                size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
              ),
            ),
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
