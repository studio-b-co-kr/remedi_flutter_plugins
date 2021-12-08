import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:remedi_vimeo_player/vimeo/vimeo_error.dart';

/// Getting data of private video from vimeo server.
class AuthApiService {
  /// id : video id
  /// accessKey : your vimeo account access key.
  Future<dynamic> loadByVideoId(
      {required String videoId, required String accessKey}) async {
    Uri uri = Uri.parse("https://api.vimeo.com/videos/$videoId");
    var res =
        await http.get(uri, headers: {"Authorization": "Bearer $accessKey"});

    if (res.statusCode != 200) {
      throw VimeoError(
          error: res.reasonPhrase,
          developerMessage: "Please check your video id",
          errorCode: res.statusCode);
    }

    return jsonDecode(res.body);
  }

  Future<dynamic> loadByEventId(
      {required String eventId, required String accessKey}) async {
    Uri uri1 = Uri.parse("https://api.vimeo.com/me/live_events/$eventId");

    Uri uri2 = Uri.parse(
        "https://api.vimeo.com/me/live_events/$eventId/m3u8_playback");
    var res = await Future.wait([
      http.get(uri1, headers: {"Authorization": "Bearer $accessKey"}),
      http.get(uri2, headers: {"Authorization": "Bearer $accessKey"})
    ]);

    if (res[1].statusCode != 200) {
      throw VimeoError(
          error: res[1].reasonPhrase,
          developerMessage: "Please check your video id",
          errorCode: res[1].statusCode);
    }

    return [jsonDecode(res[0].body), jsonDecode(res[1].body)];
  }
}
