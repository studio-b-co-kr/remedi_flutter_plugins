import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:remedi_vimeo_player/remedi_vimeo_player.dart';

class NoneAuthApiService {
  Future<dynamic> getVimeoData({required String id}) async {
    Uri uri = Uri.parse("https://player.vimeo.com/video/$id/config");
    var res = await http.get(uri);
    if (res.statusCode != 200) {
      throw VimeoError(
          error: res.reasonPhrase,
          developerMessage:
              "Please check your video id\nand accessibility is public",
          errorCode: res.statusCode);
    }

    return jsonDecode(res.body);
  }
}
