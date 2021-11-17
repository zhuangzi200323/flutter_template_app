
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_app/study/VideoFullPage.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late Timer _timer;
  late VideoPlayerController _controller;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'resources/mp4/big_buck_bunny_720p_5mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    //_controller.addListener(videoListener);
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) async {
      Duration? duration = await _controller.position;
      print(duration);
      if(duration! >= _controller.value.duration){
        _controller.seekTo(Duration.zero);
        _controller.pause();
        stopTimer();
        setState(() {
          progress = 0.0;
        });
      } else {
        setState(() {
          // progress = (duration != null ? duration.inMilliseconds : 0) /
          //     _controller.value.duration.inMilliseconds * 100.0;
          progress = (duration != null ? duration.inMilliseconds : 0).toDouble();
        });
      }
    });
  }

  void stopTimer(){
    _timer.cancel();
  }

  // addListener后特别卡，原因不明，使用timer替代
  // void videoListener() {
  //   _controller.position.then((value) => {
  //     if(value.inMilliseconds >= _controller.value.duration.inMilliseconds) {
  //       _controller.seekTo(Duration.zero)
  //     }
  //   });
  // }

  @override
  void dispose() {
    _timer.cancel();
    //_controller.removeListener(videoListener);
    _controller.dispose();
    super.dispose();
  }

  void playVideo() async {
    // _controller.position.then((value) => {
    //   if(value.inMilliseconds >= _controller.value.duration.inMilliseconds) {
    //     _controller.seekTo(Duration.zero)
    //   }
    // });
    startTimer();
    _controller.play();
    setState(() {});
  }

  void stopVideo(){
    stopTimer();
    _controller.pause();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video"),),
      body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              //width: MediaQuery.of(context).size.width,
              height: 300,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage("images/machine_bg.png"),
              //   ),
              // ),
              alignment: Alignment.bottomCenter,
              child: Hero(
                  tag: "player",
                  child: AspectRatio(
                      aspectRatio: 1280/720,
                      child: Stack(
                        children: [
                          GestureDetector(
                            child: VideoPlayer(_controller),
                            onTap: ()=>_controller.value.isPlaying ? stopVideo() : playVideo(),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Slider(
                                    min: 0,
                                    max: _controller.value.duration.inMilliseconds.toDouble(),
                                    value: progress,
                                    onChanged: (value){
                                      setState(() {
                                        _controller.seekTo(Duration(milliseconds: (value).toInt()));
                                        progress = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              // child: SeekBar(
                              //   backgroundColor: Color.fromRGBO(0, 0, 0, 0.4),
                              //   progressColor: Color.fromRGBO(0, 0, 0, 0.7),
                              //   indicatorColor: Colors.grey[350],
                              //   value: progress,
                              //   onValueChanged: (value){
                              //     print("####### ${value}");
                              //     _controller.seekTo(Duration(milliseconds: (value.progress*_controller.value.duration.inMilliseconds).toInt()));
                              //     progress = value.value;
                              //   },
                              // ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: _controller.value.isPlaying ? Container() : GestureDetector(
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
                  )
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return VideoFullPage(arguments: {"controller": _controller},);
              }));
            }, child: Text("全屏")),
          ]
      ),
    );
  }
}
