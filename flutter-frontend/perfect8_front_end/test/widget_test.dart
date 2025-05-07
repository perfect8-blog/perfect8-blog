// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect8_front_end/image_input.dart'; // Replace with actual path

void main() {
  testWidgets('ImageInput form renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ImageInput()));

    expect(find.text('Enter Title'), findsOneWidget);
    expect(find.text('Enter Description'), findsOneWidget);
    expect(find.text('Enter Image URL'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
  });
}
