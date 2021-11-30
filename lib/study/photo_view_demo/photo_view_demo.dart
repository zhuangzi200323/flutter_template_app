import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewDemo extends StatefulWidget {
  const PhotoViewDemo({Key? key}) : super(key: key);

  @override
  _PhotoViewDemoState createState() => _PhotoViewDemoState();
}

class _PhotoViewDemoState extends State<PhotoViewDemo> {
  @override
  Widget build(BuildContext context) {

    var res = (15.0).clamp(1.0, 6.0);
    print("### res = ${res}");
    return Scaffold(
      // body: PhotoView.customChild(
      //     child: Container(
      //       color: Colors.red,
      //         width: 220.0,
      //         height: 250.0,
      //         child: const Text(
      //           "Hello there, this is a text",
      //         )
      //     ),
      //     childSize: const Size(220.0, 250.0),
      //     backgroundDecoration: BoxDecoration(color: Colors.black),
      //     customSize: MediaQuery.of(context).size,
      //     // heroAttributes: const HeroAttributes(
      //     //   tag: "someTag",
      //     //   transitionOnUserGestures: true,
      //     // ),
      //     // scaleStateChangedCallback: this.onScaleStateChanged,
      //     enableRotation: false,
      //     // controller:  controller,
      //     minScale: PhotoViewComputedScale.contained * 0.8,
      //     maxScale: PhotoViewComputedScale.covered * 1.8,
      //     initialScale: PhotoViewComputedScale.contained,
      //     basePosition: Alignment.center,
      //     // scaleStateCycle: scaleStateCycle
      // ),
      body: PhotoView(
          imageProvider: AssetImage("resources/images/testw.jpg"),
          loadingBuilder: (context, progress) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: progress == null
                    ? null
                    : (progress.cumulativeBytesLoaded / progress.expectedTotalBytes!) ,
              ),
            ),
          ),
          backgroundDecoration: BoxDecoration(color: Colors.black),
          gaplessPlayback: false,
          customSize: MediaQuery.of(context).size,
          // heroAttributes: const HeroAttributes(
          //   tag: "someTag",
          //   transitionOnUserGestures: true,
          // ),
          //scaleStateChangedCallback: this.onScaleStateChanged,
          enableRotation: true,
          //controller:  controller,
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 1.8,
          initialScale: PhotoViewComputedScale.covered,
          basePosition: Alignment.center,
          //scaleStateCycle: scaleStateCycle
      ),
    );
  }
}
