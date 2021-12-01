import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TestImageView3 extends CustomPainter {
  bool needRepaint = false;
  ui.Image? _image;
  Offset _clickPoint = Offset.zero;
  ui.PictureRecorder recorder = ui.PictureRecorder();
  Canvas? myCanvas;
  Offset _pointLeftTop = Offset.zero, _pointRightTop = Offset.zero, _pointRightBottom = Offset.zero, _pointLeftBottom = Offset.zero;
  double _rotation = 0.0;
  
  TestImageView3(ui.Image image, {Offset clickPoint = Offset.zero, rotation = 0.0}) {
    _image = image;
    _clickPoint = clickPoint;
    _rotation = rotation;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if(_image != null) {
      if(myCanvas == null) {
        myCanvas = Canvas(recorder);
      }
      myCanvas!.drawImage(_image!, Offset(0, 0), Paint());

      drawText(myCanvas!, size, _clickPoint);

      canvas.drawPicture(recorder.endRecording());

      canvas.drawCircle(_clickPoint, 5, Paint());

      if(_rotation >= 0) {
        _pointLeftTop = Offset(-_image!.height * sin(_rotation) * cos(_rotation), _image!.height * sin(_rotation) * sin(_rotation));
        _pointRightTop = Offset(_image!.width * cos(_rotation) * cos(_rotation), -_image!.width * cos(_rotation) * sin(_rotation));
        _pointRightBottom = Offset(_image!.width + _image!.height * cos(_rotation) * sin(_rotation), _image!.height * cos(_rotation) * cos(_rotation));
        _pointLeftBottom = Offset(_image!.width * sin(_rotation) * sin(_rotation), _image!.height + _image!.width * sin(_rotation) * cos(_rotation));
      } else {
        _pointLeftTop = Offset(_image!.width * sin(_rotation.abs()) * sin(_rotation.abs()), -_image!.width * sin(_rotation.abs()) * cos(_rotation.abs()));
        _pointRightTop = Offset(_image!.width + _image!.height * sin(_rotation.abs()) * cos(_rotation.abs()), _image!.height * sin(_rotation.abs()) * sin(_rotation.abs()));
        _pointRightBottom = Offset(_image!.width * cos(_rotation.abs()) * cos(_rotation.abs()), _image!.height + _image!.width * cos(_rotation.abs()) * sin(_rotation.abs()));
        _pointLeftBottom = Offset(-_image!.height * cos(_rotation.abs()) * sin(_rotation.abs()), _image!.height * cos(_rotation.abs()) * cos(_rotation.abs()));
      }
      canvas.drawLine(_pointLeftTop, _pointRightTop, Paint());
      canvas.drawLine(_pointRightTop, _pointRightBottom, Paint());
      canvas.drawLine(_pointRightBottom, _pointLeftBottom, Paint());
      canvas.drawLine(_pointLeftBottom, _pointLeftTop, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant TestImageView3 oldDelegate) {
    return true;
  }

  void drawText(Canvas canvas, Size size, Offset point) {
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
    if(pointInRect(canvas, rect, point)) {
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
    if(pointInRect(canvas, rect2, point)) {
      canvas.drawRect(rect2 , Paint()
        ..strokeWidth = 2
        ..blendMode = BlendMode.color);
    }
  }

  //屏幕中的点(x, y)映射到控件中点point
  bool pointInRect(Canvas canvas, Rect rect, Offset point) {
    if(point.dx >= rect.left && point.dx <= rect.right && point.dy >= rect.top  && point.dy <= rect.bottom) {
      return true;
    }
    return false;
  }
}