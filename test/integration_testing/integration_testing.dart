import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:re_glance_testing_in_flutter/models/article.dart';
import 'package:re_glance_testing_in_flutter/pages/article_page.dart';
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
    Article(title: 'Title 1', content: 'Content 1'),
    Article(title: 'Title 2', content: 'Content 3'),
    Article(title: 'Title 3', content: 'Content 3'),
  ];

  void getThreeArticles() {
    when(() => mockNewsService.getArticles()).thenAnswer(
      (_) async => articles,
    );
  }

  group('Group Integration', () {
    testWidgets('Test for tap', (widgetTester) async {
      getThreeArticles();
      await widgetTester.pumpWidget(createNewsPage());
      await widgetTester.pump();
      await widgetTester.tap(find.text('Title 1'));
      await widgetTester.pumpAndSettle();

      expect(find.byType(NewsPage), findsNothing);
      expect(find.byType(ArticlePage), findsOneWidget);
      expect(find.text('Title 1'), findsOneWidget);
      expect(find.text('Content 1'), findsOneWidget);
    });
  });
}
