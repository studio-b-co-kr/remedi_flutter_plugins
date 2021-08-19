import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remedi_vimeo_player/remedi_vimeo_player.dart';

void main() {
  const MethodChannel channel = MethodChannel('remedi_vimeo_player');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await RemediVimeoPlayer.platformVersion, '42');
  });
}
