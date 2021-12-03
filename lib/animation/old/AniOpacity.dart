import 'package:flutter/material.dart';

class AniOpacity extends StatefulWidget {
  _AniOpacityPage  createState()=> _AniOpacityPage();
} 

class _AniOpacityPage extends State<AniOpacity> {
  bool _visible=true;
  PointerEvent? _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animate Page"),
      ),
      body: 
          Center(

            child: Column(
                  children: <Widget>[
                      AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 1000),
                        child: Image.asset("resources/images/logo.png"),
                      ),
                      ElevatedButton(
                        child: Text("显示隐藏"),
                        onPressed: (){
                          setState(() {
                            _visible=!_visible;
                          });
                         },
                      ),
                    Listener(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.blue,
                        width: 400.0,
                        height: 150.0,
                        child: Text(_event == null ? "" : _event.toString(),style: TextStyle(color: Colors.white)),
                      ),
                      onPointerDown: (PointerDownEvent event) {
                        print("onPointerDown");
                        setState(()=>_event=event);},
                      onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
                      onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
                    ),
                  ],
                ),
          )    
      );

  }
}
