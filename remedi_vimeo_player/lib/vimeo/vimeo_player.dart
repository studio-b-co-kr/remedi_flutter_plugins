import 'dart:developer' as dev;

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:remedi_vimeo_player/vimeo/vimeo_video.dart';

class VimeoPlayer extends StatefulWidget {
  final VimeoVideo vimeoVideo;
  final BetterPlayerController videoController;

  VimeoPlayer(
      {Key? key, required this.vimeoVideo, required this.videoController})
      : super(key: key);

  @override
  _VimeoPlayerState createState() => _VimeoPlayerState();
}

class _VimeoPlayerState extends State<VimeoPlayer> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    widget.videoController.dispose(forceDispose: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    dev.log("screen orientation = ${MediaQuery.of(context).orientation}",
        name: "VimeoPlayer");
    dev.log("screen width = ${MediaQuery.of(context).size.width}",
        name: "VimeoPlayer");
    dev.log("screen height = ${MediaQuery.of(context).size.height}",
        name: "VimeoPlayer");
    Widget child = AspectRatio(
      aspectRatio: widget.vimeoVideo.ratio,
      child: BetterPlayer(
        controller: widget.videoController,
      ),
    );

    if (orientation == Orientation.portrait) {
      SystemChrome.setEnabledSystemUIOverlays(
          [SystemUiOverlay.top, SystemUiOverlay.bottom]);
      return Container(
        width: MediaQuery.of(context).size.width,
        child: child,
      );
    } else {
      SystemChrome.setEnabledSystemUIOverlays([]);
      return Container(
        height: MediaQuery.of(context).size.height,
        child: child,
      );
    }
  }
}
