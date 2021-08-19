import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remedi_localization/remedi_localization.dart';

void main() {
  const MethodChannel channel = MethodChannel('remedi_localization');

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
    expect(await RemediLocalization.platformVersion, '42');
  });
}
