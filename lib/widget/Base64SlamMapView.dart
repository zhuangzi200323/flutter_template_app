import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_template_app/json/MapInfo.dart';

class Base64SlamMapView extends CustomPainter {
  bool? needRepaint;
  ui.Image? _image;
  double _left = 0, _top = 0;
  double _scale = 1;
  double _rotation = 0;
  double _downX = 0, _downY = 0;
  Matrix4 _matrix4 = Matrix4.identity();
  ui.PictureRecorder _recorder = ui.PictureRecorder();
  Canvas? _myCanvas;
  MapInfo? _mapInfo;
  double _radius = 5;

  Base64SlamMapView(ui.Image image, double left, double top, double scale, double rotation,
      double downX, double downY, MapInfo mapInfo) {
    _image = image;
    _left = left;
    _top = top;
    _scale = scale;
    _rotation = rotation;
    _downX = downX;
    _downY = downY;
    _mapInfo = mapInfo;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if(_image != null) {
      if(_myCanvas == null) {
        _myCanvas = Canvas(_recorder);
      }
      //使用canvas方法进行平移、缩放、旋转
      // //平移
      // myCanvas.translate(_left, _top);
      // //缩放
      // // myCanvas.translate(size.width/2, size.height/2);
      // myCanvas.scale(_scale);
      // // myCanvas.translate(-size.width/2, -size.height/2);
      // //旋转
      // // myCanvas.translate(size.width/2, size.height/2);
      // myCanvas.rotate(_rotation);
      // // myCanvas.translate(-size.width/2, -size.height/2);

      // 使用matrix方法进行平移、缩放、旋转
      _matrix4.translate(_left, _top, 0);
      _matrix4.scale(_scale);
      _matrix4.rotateZ(_rotation);
      _myCanvas!.transform(_matrix4.storage);
      _myCanvas!.drawImage(_image!, Offset(0, 0), Paint());
      drawPointInfo(_myCanvas!, _mapInfo!, size);

      canvas.drawPicture(_recorder.endRecording());

      // canvas.drawCircle(Offset(_downX, _downY), 2, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant Base64SlamMapView oldDelegate) {
    return true;
  }

  /*[cosA, sinA,  0.0,  0.0,
    -sinA, cosA,  0.0,  0.0,
     0.0,  0.0,  scale, 0.0,
     left, top,   0.0,  1.0]*/
  ///屏幕中的点(x, y)
  bool pointInRect(Canvas canvas, Rect rect, double x, double y) {
    if (rect == null) {
      return false;
    }
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

    // canvas.drawCircle(Offset(x1-_left, y1-_top), 5, Paint()..color = Colors.red);

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
    // canvas.drawCircle(Offset(x2-_left, y2-_top), 5, Paint()..color = Colors.green);
    // canvas.drawRect(rect, Paint()
    //           ..strokeWidth = 2
    //           ..color = Colors.yellow
    //           ..style = PaintingStyle.stroke);
    if(x2 > left && x2 < right && y2 > top  && y2 < bottom) {
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
      bool ptInRect = pointInRect(canvas, rectTmp,
          _downX, _downY);
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