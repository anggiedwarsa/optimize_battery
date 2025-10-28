import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:optimize_battery/optimize_battery.dart';

void main() {
  const MethodChannel channel = MethodChannel('optimize_battery');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return true;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('isOptimised', () async {
    expect(await OptimizeBattery.stopOptimizingBatteryUsage(), true);
  });
}
