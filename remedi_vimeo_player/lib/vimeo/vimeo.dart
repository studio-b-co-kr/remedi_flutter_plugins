import 'package:remedi_vimeo_player/vimeo/data/remote/auth_api_service.dart';
import 'package:remedi_vimeo_player/vimeo/data/remote/none_auth_api_service.dart';
import 'package:remedi_vimeo_player/vimeo/vimeo_video.dart';

/// Vimeo Class provides functions to get vimeo data.
class Vimeo {
  final String? videoId;
  final String? eventId;
  final String? accessKey;

  Vimeo({
    this.videoId,
    this.eventId,
    this.accessKey,
  })  : assert(videoId != null || eventId != null),
        assert(eventId != null && accessKey != null);

  factory Vimeo.fromUrl(Uri url, {String? accessKey}) {
    String? vId;
    String? eId;
    if (url.pathSegments.contains('event')) {
      eId = url.pathSegments.last;
    } else {
      vId = url.pathSegments.last;
    }
    return Vimeo(
      videoId: vId,
      eventId: eId,
      accessKey: accessKey,
    );
  }
}

extension ExtensionVimeo on Vimeo {
  /// get video meta data from vimeo server.
  Future<dynamic> get load async {
    if (videoId != null) {
      if (accessKey?.isEmpty ?? true) {
        return _videoWithoutAuth;
      }

      return _videoWithAuth;
    }

    return _liveStreaming;
  }

  /// get private video meta data from vimeo server
  Future<dynamic> get _videoWithAuth async {
    try {
      var res = await AuthApiService()
          .loadByVideoId(accessKey: accessKey!, videoId: videoId!);
      return await VimeoVideo.fromJsonVideoWithAuth(
          videoId: videoId!,
          accessKey: accessKey!,
          json: (res as Map<String, dynamic>));
    } catch (e) {
      return e;
    }
  }

  /// get public video meta data from vimeo server
  Future<dynamic> get _videoWithoutAuth async {
    try {
      var res = await NoneAuthApiService().getVimeoData(id: videoId!);
      return await VimeoVideo.fromJsonVideoWithoutAuth(
          res as Map<String, dynamic>);
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> get _liveStreaming async {
    try {
      var res = await AuthApiService()
          .loadByEventId(eventId: eventId!, accessKey: accessKey!);
      return VimeoVideo.fromJsonLiveEvent(res);
    } catch (e) {
      return e;
    }
  }
}
