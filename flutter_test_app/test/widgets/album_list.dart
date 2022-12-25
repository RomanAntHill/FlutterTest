import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/data/fake_data/album_fake.dart';
import 'package:flutter_test_app/data/models/album.dart';

void main() {
  List<Album> exampleResponse;
  late Album album;

  setUp(() {
    exampleResponse = new
    movie = exampleResponse.movies.first;
  });

  testWidgets('Display Movie Card', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieCard(
              key: Key("${movie.id}"),
              data: movie,
            ),
          ),
        ),
      );

      final movieFinder = find.byType(MovieCard);
      expect(movieFinder, findsOneWidget);

      Finder textFinder = find.text(movie.title ?? "");
      expect(textFinder, findsOneWidget);

      textFinder = find.text(movie.overview ?? "");
      expect(textFinder, findsOneWidget);

      textFinder = find.text(movie.releaseDate ?? "");
      expect(textFinder, findsOneWidget);
    });
  });
}