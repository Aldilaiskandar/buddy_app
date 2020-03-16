import 'package:buddy_app/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var splashScreen = MaterialApp(
    home: SplashScreen(),
  );
  group('Splash screen', () {
    testWidgets('should have 4 Container', (WidgetTester tester) async {
      await tester.pumpWidget(splashScreen);
      final container = find.byType(Container);
      expect(container, findsNWidgets(4));
    });

    testWidgets('should have 1 SizedBox', (WidgetTester tester) async {
      await tester.pumpWidget(splashScreen);
      final sizedBox = find.byKey(Key('splash_sizedBox_givenArea'));
      expect(sizedBox, findsOneWidget);
    });
  });
}
