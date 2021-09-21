import 'package:remedi_vimeo_player/vimeo/data/remote/auth_api_service.dart';
import 'package:remedi_vimeo_player/vimeo/data/remote/none_auth_api_service.dart';
import 'package:remedi_vimeo_player/vimeo/vimeo_video.dart';
/// Vimeo Class provides functions to get vimeo data.
class Vimeo {
  final String videoId;
  final String? accessKey;

  Vimeo(
    this.videoId, {
    this.accessKey,
  });
}

extension ExtensionVimeo on Vimeo {
  /// get video meta data from vimeo server.
  Future<dynamic> get video async {
    if (accessKey?.isEmpty ?? true) {
      return _noneAuth;
    }

    return _auth;
  }

  /// get private video meta data from vimeo server
  Future<dynamic> get _auth async {
    try {
      var res = await AuthApiService()
          .getVimeoData(accessKey: accessKey!, id: videoId);
      return await VimeoVideo.fromJsonAuth(
          videoId: videoId,
          accessKey: accessKey!,
          json: (res as Map<String, dynamic>));
    } catch (e) {
      return e;
    }
  }

  /// get public video meta data from vimeo server
  Future<dynamic> get _noneAuth async {
    try {
      var res = await NoneAuthApiService().getVimeoData(id: videoId);
      return await VimeoVideo.fromJsonNoneAuth(res as Map<String, dynamic>);
    } catch (e) {
      return e;
    }
  }
}
