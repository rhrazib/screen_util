import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_screen/auto_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> _initScreenUtil(WidgetTester tester, {
    Size size = const Size(375, 812),
    Orientation orientation = Orientation.portrait,
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            ScreenUtil.init(
              context,
              designWidth: 375,
              designHeight: 812,
            );
            return const SizedBox();
          },
        ),
      ),
    );

    await tester.pump();
  }

  group('ScreenUtil Initialization', () {
    testWidgets('ScreenUtil initializes correctly', (tester) async {
      await _initScreenUtil(tester);

      expect(ScreenUtil.sw, 375);
      expect(ScreenUtil.sh, 812);
    });
  });

  group('Responsive Scaling', () {
    testWidgets('Width scaling works', (tester) async {
      await _initScreenUtil(tester);

      expect(100.w, 100);
    });

    testWidgets('Height scaling works', (tester) async {
      await _initScreenUtil(tester);

      expect(200.h, 200);
    });

    testWidgets('Font scaling works', (tester) async {
      await _initScreenUtil(tester);

      expect(16.sp, 16);
    });

    testWidgets('Radius scaling works', (tester) async {
      await _initScreenUtil(tester);

      expect(12.r, 12);
    });
  });

  group('Device Type Detection', () {
    testWidgets('Detects phone correctly', (tester) async {
      await _initScreenUtil(tester, size: const Size(375, 812));
    });
  });
}