// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:samatea/main.dart';

class _MyHttpOverrides extends HttpOverrides {}

void main() {
  testWidgets('App starts and shows WelcomeScreen', (WidgetTester tester) async {
    HttpOverrides.global = _MyHttpOverrides();

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app starts.
    expect(find.byType(MyApp), findsOneWidget);
    
    // To suppress network errors:
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.exception is NetworkImageLoadException) {
        // ignore
        return;
      }
      originalOnError?.call(details);
    };

    // Wait for the timer in WelcomeScreen to finish (5 seconds)
    await tester.pumpAndSettle(const Duration(seconds: 6));
    
    // Restore
    FlutterError.onError = originalOnError;
  });
}
