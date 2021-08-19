import 'package:remedi_vimeo_player/vimeo/auth/auth_api_service.dart';
import 'package:remedi_vimeo_player/vimeo/auth/none_auth_api_service.dart';
import 'package:remedi_vimeo_player/vimeo/vimeo_video.dart';

class Vimeo {
  final String videoId;
  final String? accessKey;

  Vimeo(
    this.videoId, {
    this.accessKey,
  });
}

extension ExtensionVimeo on Vimeo {
  Future<dynamic> get vimeo async {
    if (accessKey?.isEmpty ?? true) {
      return _noneAuth;
    }

    return _auth;
  }

  Future<dynamic> get _auth async {
    var res =
        await AuthApiService().getVimeoData(accessKey: accessKey!, id: videoId);

    try {
      return VimeoVideo.fromJsonAuth(res as Map<String, dynamic>);
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> get _noneAuth async {
    var res = await NoneAuthApiService().getVimeoData(id: videoId);

    try {
      return VimeoVideo.fromJsonNoneAuth(res as Map<String, dynamic>);
    } catch (e) {
      return e;
    }
  }
}
