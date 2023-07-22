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
  RangeValues _rangeValues = const RangeValues(0, 25);

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
                    title: const Text("Flutter语言"),
                    value: checkboxValue ?? false,
                    controlAffinity: ListTileControlAffinity.leading,
                    subtitle: const Text('一枚有态度的程序员'),
                    secondary: const Icon(Icons.person),
                    onChanged: (value) {
                      setState(() {
                        checkboxValue = value;
                      });
                    }
                ),
                Text('rangeValue.start：${_rangeValues.start}' + ', rangeValue.end：${_rangeValues.end}' + ', sliderValue：$_sliderValue' + ', checkbox: $checkboxValue'),
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
                      activeTrackColor: const Color(0xff404080),
                      thumbColor: Colors.blue,
                      overlayColor: Colors.green[100],
                      valueIndicatorColor: Colors.purpleAccent),
                  child: Slider(
                    value: _sliderValue,
                    label: '$_sliderValue',
                    min: 0,
                    max: 100,
                    divisions: 5,
                    onChanged: onChangeForSlider,
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
                    divisions: 10,
                    onChanged: onChangeForSlider,
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
                  onChanged: onChangeForSlider,
                ),
                Slider.adaptive(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: onChangeForSlider,
                ),
                ElevatedButton(
                  child: const Text("DemoFlowPopMenu page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return DemoFlowPopMenu();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                      fit: BoxFit.cover
                    ),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("Flutter 学习", style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
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
                const Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  height: 60,
                  width: 250,
                  transform: Matrix4.rotationZ(0.5),
                  transformAlignment: Alignment.center,
                  child: const Text('老孟，专注分享Flutter技术及应用'),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    maxHeight: 100,
                    maxWidth: 200,
                    minHeight: 100,
                    minWidth: 100,
                  ),
                  child: const Text('老孟，专注分享Flutter技术及应用'),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                SizedBox(
                  height: 30,
                  child: SizedBox.expand(
                    child: Container(
                      color: Colors.red,
                      child: const Text("This is a test")
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                SizedBox(
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: const Text('1 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: const Text('2 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: const Text('3 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
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
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("DrawingBoard page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return Scaffold(
                        body: DrawingBoard(),
                      );
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("SliverAppBarDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return SliverAppBarDemo();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("SliverPersistentHeaderDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return SliverPersistentHeaderDemo();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  child: const Text("InteractiveViewerDemo page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return InteractiveViewerDemo();
                    }));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ]
          ),
        ),
    );
  }
}