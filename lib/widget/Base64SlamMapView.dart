import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_template_app/json/MapInfo.dart';

class Base64SlamMapView extends CustomPainter {
  bool? needRepaint;
  ui.Image? _image;
  Offset _clickPoint = Offset.zero;
  ui.PictureRecorder _recorder = ui.PictureRecorder();
  Canvas? _myCanvas;
  MapInfo? _mapInfo;
  double _radius = 5;

  Base64SlamMapView(ui.Image image, Offset clickPoint, MapInfo mapInfo) {
    _image = image;
    _clickPoint = clickPoint;
    _mapInfo = mapInfo;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if(_image != null) {
      _myCanvas ??= Canvas(_recorder);

      _myCanvas!.drawImage(_image!, Offset(0, 0), Paint());
      drawPointInfo(_myCanvas!, _mapInfo!, size);

      canvas.drawPicture(_recorder.endRecording());

      canvas.drawCircle(_clickPoint, 5, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant Base64SlamMapView oldDelegate) {
    return true;
  }

  //屏幕中的点(x, y)映射到控件中点point
  bool pointInRect(Canvas canvas, Rect rect, Offset point) {
    if (rect == null || rect.isEmpty) {
      return false;
    }
    if(point.dx >= rect.left && point.dx <= rect.right && point.dy >= rect.top  && point.dy <= rect.bottom) {
      return true;
    }
    return false;
  }

  void drawPointInfo(Canvas canvas, MapInfo mapInfo, Size size) {
    for (int i=0; i<mapInfo.data!.projects![0].positions!.positions!.length; i++) {
      double left = mapInfo.data!.projects![0].positions!.positions![i].position!.rect_left == null ? 0
          : mapInfo.data!.projects![0].positions!.positions![i].position!.rect_left!;
      double top = mapInfo.data!.projects![0].positions!.positions![i].position!.rect_top == null ? 0
          : mapInfo.data!.projects![0].positions!.positions![i].position!.rect_top!;
      double width = mapInfo.data!.projects![0].positions!.positions![i].position!.rect_width == null ? 0
          : mapInfo.data!.projects![0].positions!.positions![i].position!.rect_width!;
      double height = mapInfo.data!.projects![0].positions!.positions![i].position!.rect_height == null ? 0
          : mapInfo.data!.projects![0].positions!.positions![i].position!.rect_height!;
      Rect rectTmp = Rect.fromLTWH(left, top, width, height);
      bool ptInRect = pointInRect(canvas, rectTmp, _clickPoint);
      Color color = ptInRect ? Colors.red : Colors.black;
      double showX = mapInfo.data!.projects![0].positions!.positions![i].position!.show_x!;
      double showY = mapInfo.data!.projects![0].positions!.positions![i].position!.show_y!;
      canvas.drawCircle(Offset(showX, showY), _radius, Paint()..color=color);

      drawRotateArrow(canvas, mapInfo.data!.projects![0].positions!.positions![i].position!.theta!, showX, showY);

      TextPainter textPainter = getTextPainter(color, mapInfo.data!.projects![0].positions!.positions![i].name!, size);
      final double xCenter = showX + _radius;
      final double yCenter = showY - textPainter.height/2;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
      Rect rect = Rect.fromLTWH(showX - _radius*2, //减_radius*2将圆也包含进来
          showY - textPainter.height/2,
          textPainter.width + _radius*4, //_radius*4将文本全部包含进来
          textPainter.height);
      mapInfo.data!.projects![0].positions!.positions![i].position!.rect_left = rect.left;
      mapInfo.data!.projects![0].positions!.positions![i].position!.rect_top = rect.top;
      mapInfo.data!.projects![0].positions!.positions![i].position!.rect_width = rect.width;
      mapInfo.data!.projects![0].positions!.positions![i].position!.rect_height = rect.height;
      mapInfo.data!.projects![0].positions!.positions![i].position!.isSelect = ptInRect;
    }
  }

  TextPainter getTextPainter(Color color, String name, Size size) {
    final textStyle = TextStyle(
      color: color,
      fontSize: 20,
    );
    final textSpan = TextSpan(
      text: name,
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
    return textPainter;
  }

  ///根据圆心坐标，画此点的方向
  Paint outlinePaint = Paint()..color=Colors.green..style=PaintingStyle.fill..strokeWidth=0.5..strokeCap=StrokeCap.round;
  void drawRotateArrow(Canvas canvas, double angle, double posX, double posY) {
    double radius = _radius*0.8;
    //将角度转成弧度
    double rotateRad = -angle;//angle*Math.PI/180;
    double x1 = posX-radius*cos(rotateRad);
    double y1 = posY-radius*sin(rotateRad);
    double x2 = posX+radius*cos(rotateRad);
    double y2 = posY+radius*sin(rotateRad);
    //canvas.drawLine(Offset(posX, posY), Offset(x2, y2), outlinePaint);
    //点(x2,y2)与点(x1,y1)水平夹角，单位弧度
    double rad = atan2((y2-y1), (x2-x1));
    //箭头线条长度
    double arrowLen = 1.732*radius;
    //箭头线条与线段的夹角
    double arrowLineAngle = pi/6;
    double x3 = x2-sin(pi/2-rad-arrowLineAngle)*arrowLen;
    double y3 = y2-cos(pi/2-rad-arrowLineAngle)*arrowLen;
    canvas.drawLine(Offset(x3, y3), Offset(x2, y2), outlinePaint);
    double x4 = x2-cos(rad-arrowLineAngle)*arrowLen;
    double y4 = y2-sin(rad-arrowLineAngle)*arrowLen;
    canvas.drawLine(Offset(x2, y2), Offset(x4, y4), outlinePaint);

    canvas.drawLine(Offset(posX, posY), Offset(x3, y3), outlinePaint);
    canvas.drawLine(Offset(posX, posY), Offset(x4, y4), outlinePaint);
  }
}