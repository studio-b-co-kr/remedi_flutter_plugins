import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApiService {
  Future<dynamic> getVimeoData(
      {required String id, required String accessKey}) async {
    Uri uri = Uri.parse("https://api.vimeo.com/videos/$id");
    var res =
        await http.get(uri, headers: {"Authorization": "Bearer $accessKey"});
    return jsonDecode(res.body);
  }
}
