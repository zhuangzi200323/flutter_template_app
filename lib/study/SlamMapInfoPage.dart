import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_template_app/json/MapInfo.dart';
import 'package:flutter_template_app/utils/CenterWithOriginalSizeDelegate.dart';
import 'package:flutter_template_app/utils/Utils.dart';
import 'package:flutter_template_app/widget/Base64SlamMapView.dart';
import 'package:flutter_template_app/widget/TestImageView.dart';
import 'dart:ui' as ui;

class SlamMapInfoPage extends StatefulWidget {
  @override
  _SlamMapInfoPageState createState() => _SlamMapInfoPageState();
}

class _SlamMapInfoPageState extends State<SlamMapInfoPage> {
  ui.Image? image1;
  double left = 0, top = 0;
  double initScale = 1.0, scale = 1.0, rotation = 0;

  Offset downPosition = Offset.zero;
  double downScale = 0, downRotation = 0;
  MapInfo? mapInfo;
  List<PositionsBean>? positions;
  GlobalKey anchorKey = GlobalKey();
  Offset fingerPoint = Offset.zero;

  String data = "{\"data\" : {\"projects\":[{\"map_data\":\"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\",\"map_info\":{\"map_info\":{\"height\":457,\"origin_theta\":0,\"origin_x\":-5.50055380391934,\"origin_y\":11.983126061027363,\"resolution\":0.05,\"width\":582},\"pgm_name\":\"new_map.pgm\",\"png_name\":\"new_map.png\"},\"obstacles\":{\"obstacles\":{\"circles\":[],\"polygons\":[],\"polylines\":[],\"rectangles\":[]}},\"positions\":{\"positions\":[{\"name\":\"1\",\"position\":{\"theta\":-1.8065404422243354,\"world_x\":19.569447416783788,\"world_y\":-4.297116858894512},\"type\":2},{\"name\":\"2\",\"position\":{\"theta\":-1.7995632842135576,\"world_x\":15.331431669713472,\"world_y\":-3.715154273445293},\"type\":2},{\"name\":\"3\",\"position\":{\"theta\":-1.0033021006698363,\"world_x\":11.198516935826754,\"world_y\":-2.9019874643632626},\"type\":2},{\"name\":\"4\",\"position\":{\"theta\":-1.7088198985162588,\"world_x\":4.606330198766207,\"world_y\":-1.6907569956132633},\"type\":2},{\"name\":\"5\",\"position\":{\"theta\":-0.0260997249310575,\"world_x\":0.5096039719595664,\"world_y\":-0.817002112800763},\"type\":2}]},\"project_info\":{\"map_name\":\"map.json\",\"obstacle_name\":\"obstacle.json\",\"positions_name\":\"positions.json\",\"project_id\":\"cfb81e49-bafa-42f0-ab86-69beb515cdbd\",\"project_name\":\"0711\",\"project_stamp\":\"2020-07-11T01:50:22.287000Z\"},\"scripts\":{\"scripts\":[{\"data\":\"[{\\\"break_point_flag\\\":{\\\"type\\\":\\\"bool\\\",\\\"value\\\":false},\\\"id\\\":{\\\"type\\\":\\\"std::string\\\",\\\"value\\\":\\\"EGWXFX1HJl\\\"},\\\"sub_tasks\\\":[{\\\"break_point_flag\\\":{\\\"type\\\":\\\"bool\\\",\\\"value\\\":false},\\\"id\\\":{\\\"type\\\":\\\"std::string\\\",\\\"value\\\":\\\"M9b62f9Y2P\\\"},\\\"input_waypoint\\\":{\\\"type\\\":\\\"waypoint\\\",\\\"value\\\":{\\\"name\\\":{\\\"type\\\":\\\"std::string\\\",\\\"value\\\":\\\"4\\\"},\\\"theta\\\":{\\\"type\\\":\\\"double\\\",\\\"value\\\":1.5707963267948966},\\\"x\\\":{\\\"type\\\":\\\"double\\\",\\\"value\\\":4.606330198766207},\\\"y\\\":{\\\"value\\\":1.8762420583418162}}},\\\"required_navi_type\\\":{\\\"type\\\":\\\"enum\\\",\\\"value\\\":2},\\\"task_name\\\":{\\\"type\\\":\\\"std::string\\\",\\\"value\\\":\\\"Navi\\\"}},{\\\"break_point_flag\\\":{\\\"type\\\":\\\"bool\\\",\\\"value\\\":false},\\\"id\\\":{\\\"type\\\":\\\"std::string\\\",\\\"value\\\":\\\"kT4uHe03IG\\\"},\\\"input_waypoint\\\":{\\\"type\\\":\\\"waypoint\\\",\\\"value\\\":{\\\"name\\\":{\\\"type\\\":\\\"std::string\\\",\\\"value\\\":\\\"5\\\"},\\\"theta\\\":{\\\"type\\\":\\\"double\\\",\\\"value\\\":1.5707963267948966},\\\"x\\\":{\\\"type\\\":\\\"double\\\",\\\"value\\\":0.5096039719595664},\\\"y\\\":{\\\"value\\\":5.972968285148457}}},\\\"required_navi_type\\\":{\\\"type\\\":\\\"enum\\\",\\\"value\\\":2},\\\"task_name\\\":{\\\"type\\\":\\\"std::string\\\",\\\"value\\\":\\\"Navi\\\"}}],\\\"task_name\\\":{\\\"type\\\":\\\"std::string\\\",\\\"value\\\":\\\"Loop\\\"},\\\"times\\\":{\\\"type\\\":\\\"unsigned int\\\",\\\"value\\\":1}}]\",\"script_name\":\"robot_patrol.script\"}]}}]}, \"module\" : \"/api/sync/PullSyncProject\", \"result_code\" : 0, \"result_msg\" : \"success\",\"result_serial_number\" : \"27002D3820\", \"result_stamp\" : \"2021-07-25T08:22:10.664128Z\"}";

  @override
  void initState() {
    Map<String, dynamic> jsonMap = json.decode(data);
    mapInfo = JsonConvert.fromJsonAsT<MapInfo>(jsonMap);
    for (int i=0; i<mapInfo!.data!.projects![0].positions!.positions!.length; i++) {
      double wx = 0 - mapInfo!.data!.projects![0].map_info!.map_info!.origin_x!;
      double wy = mapInfo!.data!.projects![0].map_info!.map_info!.origin_y!;
      mapInfo!.data!.projects![0].positions!.positions![i].position!.show_x = (mapInfo!.data!.projects![0].positions!.positions![i].position!
          .world_x! + wx) / mapInfo!.data!.projects![0].map_info!.map_info!.resolution!;
      mapInfo!.data!.projects![0].positions!.positions![i].position!.show_y = (wy - mapInfo!.data!.projects![0].positions!.positions![i].position!
          .world_y!) / mapInfo!.data!.projects![0].map_info!.map_info!.resolution!;
    }
    Uint8List bytes = Base64Decoder().convert(mapInfo!.data!.projects![0].map_data!);

    decodeImageFromList(bytes).then((value) {
      setState(() {
        image1 = value;
        double hScale = MediaQuery.of(context).size.height/image1!.height;
        double wScale = MediaQuery.of(context).size.width/image1!.width;
        initScale = hScale < wScale ? hScale : wScale;
        scale = initScale;
      });
    });
    super.initState();
  }

  onScaleStart(ScaleStartDetails details) {
    // print("@@@@@@@@@@@@@@@onScaleStart => ${details}");
    downPosition = details.focalPoint;
    downScale = 1.0;
    downRotation = rotation;
    if (anchorKey.currentContext != null) {
      RenderBox renderBox = anchorKey.currentContext!
          .findRenderObject()! as RenderBox;
      var offset = renderBox.localToGlobal(Offset.zero);
      print("onScaleStart view offset=${offset}");
      fingerPoint = renderBox.globalToLocal(details.focalPoint);
    }
  }

  onScaleUpdate(ScaleUpdateDetails details) {
    // print("@@@@@@@@@@@@@@@ => scale=${scale}, rotation=${rotation}, ${details.focalPoint}");
    var deltaLeft = 0.0; //deltaLeft > 0是向右滑动；deltaLeft < 0是向左滑动
    var deltaTop = 0.0; //deltaTop > 0是向下滑动；deltaTop < 0是向上滑动
    if(details.pointerCount > 1) {
      setState(() {
        scale += details.scale - downScale;
        downScale = details.scale;

        rotation = downRotation + details.rotation;
      });
    } else {
      setState(() {
        deltaLeft = details.focalPoint.dx - downPosition.dx;
        left += deltaLeft;
        deltaTop = details.focalPoint.dy - downPosition.dy;
        top += deltaTop;
        downPosition = details.focalPoint;
      });
    }

    if (anchorKey.currentContext != null) {
      RenderBox renderBox = anchorKey.currentContext!.findRenderObject()! as RenderBox;
      var leftTop = renderBox.localToGlobal(Offset.zero);
      var rightTop = renderBox.localToGlobal(Offset(image1!.width.toDouble(), 0));
      var rightBottom = renderBox.localToGlobal(Offset(image1!.width.toDouble(), image1!.height.toDouble()));
      var leftBottom = renderBox.localToGlobal(Offset(0, image1!.height.toDouble()));

      Offset leftPoint = getLeftPoint(leftTop, rightTop, rightBottom, leftBottom);
      Offset rightPoint = getRightPoint(leftTop, rightTop, rightBottom, leftBottom);
      Offset topPoint = getTopPoint(leftTop, rightTop, rightBottom, leftBottom);
      Offset bottomPoint = getBottomPoint(leftTop, rightTop, rightBottom, leftBottom);

      if (leftPoint.dx >= 0 && deltaLeft > 0 ||//图像左边缘已经在屏幕内，无法向右再滑动
          rightPoint.dx <= MediaQuery.of(context).size.width && deltaLeft < 0) {//图像右边缘已经在屏幕内，无法向左再滑动
        left -= deltaLeft;
      }
      if (topPoint.dy >= 0 && deltaTop > 0 ||//图像上边缘已经在屏幕内，无法向下再滑动
          bottomPoint.dy <= MediaQuery.of(context).size.height && deltaTop < 0) {//图像下边缘已经在屏幕内，无法向上再滑动
        top -= deltaTop;
      }

      fingerPoint = renderBox.globalToLocal(details.focalPoint);
    }
  }

  onScaleEnd(ScaleEndDetails details) {
    if (scale < initScale) {
      scale = initScale;
    } else if (scale > 2.0) {
      scale = 2.0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image1 == null || mapInfo == null) {
      return Container();
    }
    final matrix4 = Matrix4.identity();
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
              delegate: CenterWithOriginalSizeDelegate(Size(image1!.width.toDouble(), image1!.height.toDouble()), Alignment.center),
                child: CustomPaint(
                  painter: Base64SlamMapView(image1!, fingerPoint, mapInfo!),
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
}
