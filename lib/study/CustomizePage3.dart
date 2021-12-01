import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_app/widget/TestImageView.dart';
import 'dart:ui' as ui;

import 'package:flutter_template_app/widget/TestImageView2.dart';
import 'package:flutter_template_app/widget/TestImageView3.dart';

class CustomizePage3 extends StatefulWidget {
  @override
  _CustomizePageState createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage3> {
  ui.Image? image1;
  double left = 0, top = 0;
  double initScale = 1.0, scale = 1.0, rotation = 0;

  Offset downPosition = Offset.zero;
  double downScale = 0, downRotation = 0;
  Offset fingerPoint = Offset.zero;

  GlobalKey anchorKey = GlobalKey();

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
      setState(() {});
    });
    super.initState();
  }

  onScaleStart(ScaleStartDetails details) {
    // print("@@@@@@@@@@@@@@@onScaleStart => ${details}");
    downPosition = details.focalPoint;
    downScale = 1.0;
    downRotation = 0;
    if (anchorKey.currentContext != null) {
      RenderBox renderBox = anchorKey.currentContext!
          .findRenderObject()! as RenderBox;
      var offset = renderBox.localToGlobal(Offset.zero);
      print("onScaleStart view offset=${offset}");
      fingerPoint = renderBox.globalToLocal(details.focalPoint);
    }
    setState(() {});
  }

  onScaleUpdate(ScaleUpdateDetails details) {
    // print("@@@@@@@@@@@@@@@ => scale=${scale}, rotation=${rotation}, ${details.focalPoint}, left => ${left}, top => ${top}, size=${MediaQuery.of(context).size}");
    var deltaLeft = 0.0; //deltaLeft > 0是向右滑动；deltaLeft < 0是向左滑动
    var deltaTop = 0.0; //deltaTop > 0是向下滑动；deltaTop < 0是向上滑动
    if (details.pointerCount > 1) {
      scale += details.scale - downScale;
      downScale = details.scale;

      rotation += details.rotation - downRotation;
      downRotation = details.rotation;
    } else {
      deltaLeft = details.focalPoint.dx - downPosition.dx;
      left += deltaLeft;
      deltaTop = details.focalPoint.dy - downPosition.dy;
      top += deltaTop;
      downPosition = details.focalPoint;
    }

    if (anchorKey.currentContext != null) {
      RenderBox renderBox = anchorKey.currentContext!.findRenderObject()! as RenderBox;
      var offset = renderBox.localToGlobal(Offset.zero);
      if(rotation >= 0) {
        if ((offset.dx - image1!.height * scale * sin(rotation) >= 0 && deltaLeft > 0) || //图像左边缘已经在屏幕内，无法向右再滑动
            (image1!.width * scale * cos(rotation) + offset.dx <= MediaQuery.of(context).size.width && deltaLeft < 0)) {//图像右边缘已经在屏幕内，无法向左再滑动
          left -= deltaLeft;
        }
        if ((offset.dy >= 0 && deltaTop > 0) ||//图像上边缘已经在屏幕内，无法向下再滑动
            (offset.dy + image1!.height * scale * cos(rotation) + image1!.width * scale * sin(rotation) <= MediaQuery.of(context).size.height && deltaTop < 0)) {//图像下边缘已经在屏幕内，无法向上再滑动
          top -= deltaTop;
        }
      } else {
        if ((offset.dx >= 0 && deltaLeft > 0) ||
            (image1!.width * scale * cos(rotation.abs()) + image1!.height * scale * sin(rotation.abs()) + offset.dx <= MediaQuery.of(context).size.width && deltaLeft < 0)) {
          left -= deltaLeft;
        }
        if ((offset.dy - image1!.width * scale * sin(rotation.abs()) >= 0 && deltaTop > 0) ||
            (offset.dy + image1!.height * scale * cos(rotation.abs()) <= MediaQuery.of(context).size.height && deltaTop < 0)) {
          top -= deltaTop;
        }
      }
      fingerPoint = renderBox.globalToLocal(details.focalPoint);
    }

    setState(() {});
  }

  onScaleEnd(ScaleEndDetails details) {
    print("@@@@@@@@@@@@@@@ => left=${left}, top=${top}");

    if (scale < initScale) {
      scale = initScale;
    } else if (scale > 2.0) {
      scale = 2.0;
    }

    setState(() {});
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
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onScaleStart: (details) => onScaleStart(details),
          onScaleUpdate: (details) => onScaleUpdate(details),
          onScaleEnd: (details) => onScaleEnd(details),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            child: Transform(
              alignment: Alignment.center,
              transform: matrix4,
              child: CustomSingleChildLayout(
                delegate: _CenterWithOriginalSizeDelegate(Size(image1!.width.toDouble(), image1!.height.toDouble()), Alignment.center),
                child: CustomPaint(
                  painter: TestImageView3(image1!, clickPoint: fingerPoint, rotation: rotation),
                  size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
                  key: anchorKey,
                ),
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

class _CenterWithOriginalSizeDelegate extends SingleChildLayoutDelegate {
  const _CenterWithOriginalSizeDelegate(
      this.subjectSize,
      this.basePosition,
      );

  final Size subjectSize;
  final Alignment basePosition;

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final childWidth = subjectSize.width;
    final childHeight = subjectSize.height;

    final halfWidth = (size.width - childWidth) / 2;
    final halfHeight = (size.height - childHeight) / 2;

    final double offsetX = halfWidth * (basePosition.x + 1);
    final double offsetY = halfHeight * (basePosition.y + 1);
    // print("childWidth=${childWidth}, childHeight=${childHeight}, size.width=${size.width}, size.height=${size.height},"
    //     "offsetX=${offsetX}, offsetY=${offsetY}, basePosition.x=${basePosition.x}, basePosition.y=${basePosition.y}");
    return Offset(offsetX, offsetY);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(subjectSize);
  }

  @override
  bool shouldRelayout(_CenterWithOriginalSizeDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _CenterWithOriginalSizeDelegate &&
              runtimeType == other.runtimeType &&
              subjectSize == other.subjectSize &&
              basePosition == other.basePosition;

  @override
  int get hashCode =>
      subjectSize.hashCode ^ basePosition.hashCode;
}
