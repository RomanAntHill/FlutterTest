import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/data/fake_data/album_fake.dart';
import 'package:flutter_test_app/data/models/album.dart';
import 'package:flutter_test_app/data/repositories/album_repository.dart';
import 'package:flutter_test_app/injection.dart';
import 'package:flutter_test_app/main.dart';

void main() {
  group('widgets', () {
    configureDependencies();
    testWidgets('app test', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MyApp());
      });
      expect(find.text('Album List'), findsOneWidget);
      expect(const Card(), findsOneWidget);
    });
  });
}
