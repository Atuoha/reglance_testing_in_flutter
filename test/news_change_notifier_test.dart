import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:re_glance_testing_in_flutter/models/article.dart';
import 'package:re_glance_testing_in_flutter/providers/news_notifier.dart';
import 'package:re_glance_testing_in_flutter/services/news_service.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late MockNewsService mockNewsService;
  late NewsChangeNotifier sut;

  setUp(
    () => {
      mockNewsService = MockNewsService(),
      sut = NewsChangeNotifier(mockNewsService),
    },
  );

  test(
    'initial values are correct',
    () => {
      expect(sut.articles, []),
      expect(sut.isLoading, false),
    },
  );

  group('getArticle', () {
    final List<Article> articles = [
      Article(title: 'Title 1', content: 'Content 1'),
      Article(title: 'Title 2', content: 'Content 3'),
      Article(title: 'Title 3', content: 'Content 3'),
    ];

    void getThreeArticles() {
      when(() => mockNewsService.getArticles()).thenAnswer(
        (_) async => articles,
      );
    }

    test('gets articles using the newsService', () async {
      getThreeArticles();

      await sut.getArticles();
      verify(() => mockNewsService.getArticles()).called(1);
    });

    test(
        'Show that data is been loaded, Show that articles fetched are from service, Show that data is not loaded again',
        () async {
      getThreeArticles();

      final future = sut.getArticles();
      expect(sut.isLoading, true); // 1 test
      await future;

      expect(sut.articles, articles); // 2 test
      expect(sut.isLoading, false); // 3 test
    });
  });
}
