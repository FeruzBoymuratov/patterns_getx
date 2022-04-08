// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:patterns_get_x/main.dart';
import 'package:patterns_get_x/pages/home_page.dart';

void main() {
  testWidgets('Details Page Tester', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    //await tester.tap(find.text("QUI EST ESSE"));


      await tester.tapAt(tester.getCenter(find.byWidget(ListView())));

    await tester.pump();

    expect(find.byType(Text), findsNWidgets(4));

  });
}
