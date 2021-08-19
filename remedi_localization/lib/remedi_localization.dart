import 'dart:async';

import 'package:flutter/services.dart';

export 'package:remedi_localization/country_list_pick.dart';
export 'package:remedi_localization/country_selection_theme.dart';
export 'package:remedi_localization/support/code_country.dart';

class RemediLocalization {
  static const MethodChannel _channel =
      const MethodChannel('remedi_localization');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
