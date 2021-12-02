import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg) {
  Fluttertoast.showToast(msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0);
}

//找到最左侧的点
Offset getLeftPoint(Offset leftTop, Offset rightTop, Offset rightBottom, Offset leftBottom) {
  Offset leftPoint = Offset.zero;

  if (leftTop.dx < leftPoint.dx) {
    leftPoint = leftTop;
  }
  if (rightTop.dx < leftPoint.dx) {
    leftPoint = rightTop;
  }
  if (rightBottom.dx < leftPoint.dx) {
    leftPoint = rightBottom;
  }
  if (leftBottom.dx < leftPoint.dx) {
    leftPoint = leftBottom;
  }
  return leftPoint;
}

//找到最右侧的点
Offset getRightPoint(Offset leftTop, Offset rightTop, Offset rightBottom, Offset leftBottom) {
  Offset rightPoint = Offset.zero;

  if (leftTop.dx > rightPoint.dx) {
    rightPoint = leftTop;
  }
  if (rightTop.dx > rightPoint.dx) {
    rightPoint = rightTop;
  }
  if (rightBottom.dx > rightPoint.dx) {
    rightPoint = rightBottom;
  }
  if (leftBottom.dx > rightPoint.dx) {
    rightPoint = leftBottom;
  }
  return rightPoint;
}

//找到最上方的点
Offset getTopPoint(Offset leftTop, Offset rightTop, Offset rightBottom, Offset leftBottom) {
  Offset topPoint = Offset.zero;

  if (leftTop.dy < topPoint.dy) {
    topPoint = leftTop;
  }
  if (rightTop.dy < topPoint.dy) {
    topPoint = rightTop;
  }
  if (rightBottom.dy < topPoint.dy) {
    topPoint = rightBottom;
  }
  if (leftBottom.dy < topPoint.dy) {
    topPoint = leftBottom;
  }
  return topPoint;
}

//找到最下方的点
Offset getBottomPoint(Offset leftTop, Offset rightTop, Offset rightBottom, Offset leftBottom) {
  Offset bottomPoint = Offset.zero;

  if (leftTop.dy > bottomPoint.dy) {
    bottomPoint = leftTop;
  }
  if (rightTop.dy > bottomPoint.dy) {
    bottomPoint = rightTop;
  }
  if (rightBottom.dy > bottomPoint.dy) {
    bottomPoint = rightBottom;
  }
  if (leftBottom.dy > bottomPoint.dy) {
    bottomPoint = leftBottom;
  }
  return bottomPoint;
}