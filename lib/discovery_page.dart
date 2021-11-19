import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:flutter_template_app/study/CylinderChart.dart';
import 'package:flutter_template_app/study/DemoFlowPopMenu.dart';
import 'package:flutter_template_app/study/DrawingBoard.dart';
import 'package:flutter_template_app/study/InteractiveViewerDemo.dart';
import 'package:flutter_template_app/study/SliverAppBarDemo.dart';
import 'package:flutter_template_app/study/SliverPersistentHeaderDemo.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  bool? checkboxValue;
  double _sliderValue = 0;
  RangeValues _rangeValues = RangeValues(0, 25);

  void onChangeForSlider(double v) {
    setState(() {
      _sliderValue = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CheckboxListTile(
                    title: Text("Flutter语言"),
                    value: checkboxValue == null ? false : checkboxValue,
                    controlAffinity: ListTileControlAffinity.leading,
                    subtitle: Text('一枚有态度的程序员'),
                    secondary: Icon(Icons.person),
                    onChanged: (value) {
                      setState(() {
                        checkboxValue = value;
                      });
                    }
                ),
                Text('值：$_sliderValue'),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: onChangeForSlider,
                ),
                Slider(
                  activeColor: Colors.red,
                  inactiveColor: Colors.blue,
                  value: _sliderValue,
                  label: '$_sliderValue',
                  min: 0,
                  max: 100,
                  divisions: 4,
                  onChanged: onChangeForSlider,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xff404080),
                      thumbColor: Colors.blue,
                      overlayColor: Colors.green,
                      valueIndicatorColor: Colors.purpleAccent),
                  child: Slider(
                    value: _sliderValue,
                    label: '$_sliderValue',
                    min: 0,
                    max: 100,
                    divisions: 4,
                    onChanged: (v) {
                      setState(() {
                        _sliderValue = v;
                      });
                    },
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  ),
                  child: Slider(
                    value: _sliderValue,
                    label: '$_sliderValue',
                    min: 0,
                    max: 100,
                    divisions: 4,
                    onChanged: (v) {
                      setState(() {
                        _sliderValue = v;
                      });
                    },
                  ),
                ),
                RangeSlider(
                  values: _rangeValues,
                  labels: RangeLabels('${_rangeValues.start}','${_rangeValues.end}'),
                  min: 0,
                  max: 100,
                  //divisions: 4,
                  onChanged: (v) {
                    setState(() {
                      _rangeValues = v;
                    });
                  },
                ),
                CupertinoSlider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (v) {
                    setState(() {
                      _sliderValue = v;
                    });
                  },
                ),
                Slider.adaptive(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (v) {
                    setState(() {
                      _sliderValue = v;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("DemoFlowPopMenu page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return DemoFlowPopMenu();
                    }));
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                      fit: BoxFit.cover
                    ),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Flutter 学习", style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Text('老孟，专注分享Flutter技术及应用'),
                  alignment: Alignment.center,
                  height: 60,
                  width: 250,
                  transform: Matrix4.rotationZ(0.5),
                  transformAlignment: Alignment.center,
                ),
                Container(
                  color: Colors.blue,
                  child: Text('老孟，专注分享Flutter技术及应用'),
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    maxHeight: 100,
                    maxWidth: 200,
                    minHeight: 100,
                    minWidth: 100,
                  ),
                ),
                Container(
                  height: 30,
                  child: SizedBox.expand(
                    child: Container(
                      color: Colors.red,
                      child: Text("This is a test")
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: Text('1 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: Text('2 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: Text('3 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  child: Text("CylinderChart page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return Scaffold(
                        body: CylinderChart(),
                      );
                    }));
                  },
                ),
                ElevatedButton(
                  child: Text("DrawingBoard page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return Scaffold(
                        body: DrawingBoard(),
                      );
                    }));
                  },
                ),
                ElevatedButton(
                  child: Text("SliverAppBarDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return SliverAppBarDemo();
                    }));
                  },
                ),
                ElevatedButton(
                  child: Text("SliverPersistentHeaderDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return SliverPersistentHeaderDemo();
                    }));
                  },
                ),
                ElevatedButton(
                  child: Text("InteractiveViewerDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return InteractiveViewerDemo();
                    }));
                  },
                ),
              ]
          ),
        ),
    );
  }
}