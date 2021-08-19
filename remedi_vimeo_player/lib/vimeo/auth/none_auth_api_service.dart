import 'dart:convert';

import 'package:http/http.dart' as http;

class NoneAuthApiService {
  Future<dynamic> getVimeoData({required String id}) async {
    Uri uri = Uri.parse("https://player.vimeo.com/video/$id/config");
    var res = await http.get(uri);
    return jsonDecode(res.body);
  }
}
