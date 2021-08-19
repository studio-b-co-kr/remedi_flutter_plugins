import 'dart:async';

import 'package:flutter/services.dart';

export 'package:better_player/better_player.dart';
export 'package:remedi_vimeo_player/vimeo/vimeo.dart';
export 'package:remedi_vimeo_player/vimeo/vimeo_error.dart';
export 'package:remedi_vimeo_player/vimeo/vimeo_player.dart';
export 'package:remedi_vimeo_player/vimeo/vimeo_video.dart';

class RemediVimeoPlayer {
  static const MethodChannel _channel =
      const MethodChannel('remedi_vimeo_player');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
