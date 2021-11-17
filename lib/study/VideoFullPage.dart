
import 'dart:async';

import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoFullPage extends StatefulWidget {
  final arguments;

  VideoFullPage({Key? key, this.arguments}) : super(key: key);

  @override
  _VideoFullPageState createState() => _VideoFullPageState();
}

class _VideoFullPageState extends State<VideoFullPage> {
  late Timer _timer;
  double progress = 0;

  @override
  void initState() {
    //SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    AutoOrientation.landscapeAutoMode();
    super.initState();
  }

  @override
  void dispose() {
    AutoOrientation.portraitAutoMode();
    super.dispose();
  }

  void playVideo() async {
    widget.arguments["controller"].play();
    setState(() {});
  }

  void stopVideo(){
    widget.arguments["controller"].pause();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Center(
              child: AspectRatio(
                  aspectRatio: 1280/720,
                  child: Stack(
                    children: [
                      GestureDetector(
                        child: VideoPlayer(widget.arguments["controller"]),
                        onTap: ()=>widget.arguments["controller"].value.isPlaying ? stopVideo() : playVideo(),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: widget.arguments["controller"].value.isPlaying ? Container() : GestureDetector(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                            child: Icon(Icons.play_arrow, color: Colors.white,),
                          ),
                          onTap: ()=> playVideo(),
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, right: 20),
              child: IconButton(
                icon: const BackButtonIcon(),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
