import 'dart:developer' as dev;

/// Android intent uri 를 flutter 에서 사용할 수 있도록 parsing 합니다.
/// 다시 만들어진 uri 는 url_launcher의 launch()를 통해서 사용할 수 있습니다.
extension UriExtension on Uri {
  static Uri androidIntentUrlOrigin(String uriString) {
    Uri uri = Uri.parse(uriString);
    if (uri.scheme == 'intent') {
      var firstSplits = uriString.split("#Intent;");
      dev.log("firstSplits = $firstSplits");
      if (firstSplits[1].contains('scheme')) {
        var secondSplits = (firstSplits[1]).split(";");
        dev.log("secondSplits = $secondSplits");
        var scheme = secondSplits
            .where((e) => e.contains('scheme'))
            .toList()[0]
            .split("=")[1];
        var authority = uri.authority;
        uri = Uri.parse("$scheme://$authority?${uri.query}");
      } else {
        var tempUri = Uri.parse(uri.path);
        dev.log("tempUri = $tempUri");
        var newUri = Uri.parse("$tempUri?${uri.query}");
        dev.log("newUri = $newUri");
        uri = newUri;
      }
    }
    dev.log("uri = ${uri.toString()}");
    return uri;
  }
}
