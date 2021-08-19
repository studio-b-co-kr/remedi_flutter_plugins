library remedi_send_to_store;

import 'dart:async';

import 'package:flutter/services.dart';

class RemediSendToStore {
  static const MethodChannel _channel = const MethodChannel('send_to_store');

  /// Note: It will not work with the iOS Simulator
  static Future<void> send({String? androidAppId, String? iOSAppId}) async {
    await _channel.invokeMethod(
        'send', {'android_id': androidAppId, 'ios_id': iOSAppId});
    return null;
  }
}
