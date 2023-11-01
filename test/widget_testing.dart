import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:re_glance_testing_in_flutter/models/article.dart';
import 'package:re_glance_testing_in_flutter/pages/news_page.dart';
import 'package:re_glance_testing_in_flutter/providers/news_notifier.dart';
import 'package:re_glance_testing_in_flutter/services/news_service.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late MockNewsService mockNewsService;

  setUp(() => {
        mockNewsService = MockNewsService(),
      });

  Widget createNewsPage() => ChangeNotifierProvider(
        create: (_) => NewsChangeNotifier(mockNewsService),
        child: const MaterialApp(
          home: NewsPage(),
        ),
      );

  final List<Article> articles = [
    // Article(title: 'Title 1', content: 'Content 1'),
    // Article(title: 'Title 2', content: 'Content 3'),
    // Article(title: 'Title 3', content: 'Content 3'),
  ];

  void getThreeArticles() {
    when(() => mockNewsService.getArticles()).thenAnswer(
      (_) async => articles,
    );
  }

  void getThreeArticlesWaitFor3Seconds() {
    when(() => mockNewsService.getArticles()).thenAnswer(
      (_) async {
        await Future.delayed(const Duration(seconds: 3));
        return articles;
      },
    );
  }

  group('Test For Widgets', () {
    testWidgets('Test Widget Items', (widgetTester) async {
      getThreeArticles();
      await widgetTester.pumpWidget(createNewsPage());
      expect(find.text('News'), findsOneWidget);
    });

    testWidgets('Test For Loading', (widgetTester) async {
      getThreeArticlesWaitFor3Seconds();
      await widgetTester.pumpWidget(createNewsPage());
      await widgetTester.pump(const Duration(milliseconds: 500));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await widgetTester.pumpAndSettle();
    });

    testWidgets('Test For Articles', (widgetTester) async {
      getThreeArticles();
      await widgetTester.pumpWidget(createNewsPage());
      await widgetTester.pump();

      for (final article in articles) {
        expect(find.text(article.title), findsOneWidget);
        expect(find.text(article.content), findsOneWidget);
      }

      await widgetTester.pumpAndSettle();
    });
  });
}
