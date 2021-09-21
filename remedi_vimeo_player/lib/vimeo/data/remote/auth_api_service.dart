import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:remedi_vimeo_player/vimeo/vimeo_error.dart';

class AuthApiService {
  Future<dynamic> getVimeoData(
      {required String id, required String accessKey}) async {
    Uri uri = Uri.parse("https://api.vimeo.com/videos/$id");
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
}
