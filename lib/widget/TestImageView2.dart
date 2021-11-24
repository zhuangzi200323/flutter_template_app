import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TestImageView2 extends CustomPainter {
  bool needRepaint = false;
  ui.Image? _image;
  double _left = 0, _top = 0;
  double _scale = 0;
  double _rotation = 0;
  double _centerX = 0, _centerY = 0;
  // Matrix4 matrix4 = Matrix4.identity();
  ui.PictureRecorder recorder = ui.PictureRecorder();
  Canvas? myCanvas;


  TestImageView2(ui.Image image, {double left=0, double top=0, scale=0, rotation=0.0, centerX=0, centerY=0}) {
    _image = image;
    _left = left;
    _top = top;
    _scale = scale;
    _rotation = rotation;
    _centerX = centerX;
    _centerY = centerY;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if(_image != null) {
      if(myCanvas == null) {
        myCanvas = Canvas(recorder);
      }

      myCanvas!.drawImage(_image!, Offset(0, 0), Paint());

      drawText(myCanvas!, size, _centerX, _centerY);

      canvas.drawPicture(recorder.endRecording());

      canvas.drawCircle(Offset(_centerX, _centerY), 2, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant TestImageView2 oldDelegate) {
    return true;
  }

  void drawText(Canvas canvas, Size size, double downX, double downY) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    final textSpan = TextSpan(
      text: 'Hello, world.',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final double xCenter = 100;//(size.width - textPainter.width) / 2;
    final double yCenter = 100;//(size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
    Rect rect = Rect.fromLTWH(
        xCenter, yCenter, textPainter.width, textPainter.height);
    if(pointInRect(canvas, rect, downX, downY)) {
      canvas.drawRect(rect , Paint()
        ..strokeWidth = 2
        ..blendMode = BlendMode.color);
    }

    final textSpan2 = TextSpan(
      text: 'Hello, world2.',
      style: textStyle,
    );
    final textPainter2 = TextPainter(
      text: textSpan2,
      textDirection: TextDirection.ltr,
    );
    textPainter2.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final double xCenter2 = 1100;//(size.width - textPainter.width) / 2;
    final double yCenter2 = 600;//(size.height - textPainter.height) / 2;
    final offset2 = Offset(xCenter2, yCenter2);
    textPainter2.paint(canvas, offset2);
    Rect rect2 = Rect.fromLTWH(
        xCenter2, yCenter2, textPainter2.width, textPainter2.height);
    if(pointInRect(canvas, rect2, downX, downY)) {
      canvas.drawRect(rect2 , Paint()
        ..strokeWidth = 2
        ..blendMode = BlendMode.color);
    }
  }

  /*[cosA, sinA,  0.0,  0.0,
    -sinA, cosA,  0.0,  0.0,
     0.0,  0.0,  scale, 0.0,
     left, top,   0.0,  1.0]*/
  ///屏幕中的点(x, y)
  bool pointInRect(Canvas canvas, Rect rect, double x, double y) {
    double x0 = _left;
    double y0 = _top;
    //点(x, y)相对于点(x0, y0)旋转了rotation度后，得到点(x1, y1)
    // https://blog.csdn.net/abcdef314159/article/details/52813313
    // x = x1*cosB - y1*sinB + x0*(1 - cosB) + y0*sinB;
    // y = x1*sinB + y1*cosB + y0*(1-cosB) - x0*sinB;
    // 由上方公式可计算得到点(x1, y1)
    // x1 = (x*cosB - x0*(1-cosB)*cosB - y0*sinB*cosB + y*sinB - y0*(1-cosB)*sinB + x0*sinB*sinB)/(cosB*cosB + sinB*sinB);
    // y1 = (y*cosB - y0*(1-cosB)*cosB + x0*sinB*cosB - x*sinB + x0*(1-cosB)*sinB + y0*sinB*sinB)/(cosB*cosB + sinB*sinB);
    //简化后
    // x1 = (cosB*(x - x0*(1-cosB) - y0*sinB) + sinB*(y - y0*(1-cosB) + x0*sinB))/(cosB*cosB + sinB*sinB);
    // y1 = (cosB*(y - y0*(1-cosB) + x0*sinB) - sinB*(x - x0*(1-cosB) - y0*sinB))/(cosB*cosB + sinB*sinB);
    double denominator = cos(_rotation)*cos(_rotation) + sin(_rotation)*sin(_rotation); //分母
    double x1 = (cos(_rotation)*(x - x0*(1-cos(_rotation)) - y0*sin(_rotation)) + sin(_rotation)*(y - y0*(1-cos(_rotation)) + x0*sin(_rotation)))/denominator;
    double y1 = (cos(_rotation)*(y - y0*(1-cos(_rotation)) + x0*sin(_rotation)) - sin(_rotation)*(x - x0*(1-cos(_rotation)) - y0*sin(_rotation)))/denominator;

    // var scaleOffsetX = (rect.width-rect.width*_scale)/2;
    // var scaleOffsetY = (rect.height-rect.height*_scale)/2;
    var left = rect.left + _left;// + scaleOffsetX;
    var top = rect.top + _top;// + scaleOffsetY;
    var right = rect.right + _left;// - scaleOffsetX;
    var bottom = rect.bottom + _top;// - scaleOffsetY;

    // 点(x2, y2)相对于点(x0, y0)缩放了_scale倍后得到坐标为点(x1, y1)
    // x1 = x0 + _scale*(x2 - x0);
    // y1 = y0 + _scale*(y2 - y0);
    // 由上方公式可计算得到点(x2, y2)
    // x2 = (x1 - x0)/_scale + x0;
    // y2 = (y1 - y0)/_scale + y0;
    double x2 = (x1 - x0)/_scale + x0;
    double y2 = (y1 - y0)/_scale + y0;
    // print("rect.left = ${left}, rect.top = ${top}, rect.right = ${right}, rect.bottom = ${bottom}");
    // print("x2 > left = ${x2 > left}, x2 < right = ${x2 < right}, y2 > top = ${y2 > top}, y2 < bottom = ${y2 < bottom}");
    canvas.drawCircle(Offset(x2-_left, y2-_top), 5, Paint()..color = Colors.green);
    if(x2 > left && x2 < right && y2 > top  && y2 < bottom) {
      return true;
    }
    return false;
  }
}