import 'dart:developer' as dev;

extension UriExtension on Uri {
  static Uri fromToss(String uriString) {
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
