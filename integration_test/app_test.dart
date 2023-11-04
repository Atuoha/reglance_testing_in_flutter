import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:re_glance_testing_in_flutter/integration_test/screens/display_text.dart';
import 'package:re_glance_testing_in_flutter/integration_test/screens/typing.dart';
import 'package:re_glance_testing_in_flutter/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Test that the input text is not empty while it takes to the different page",
    (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());

      await widgetTester.tap(find.byType(FloatingActionButton));
      await widgetTester.pump();
      expect(find.text('Value can not be empty'), findsOneWidget);
      expect(find.byType(TypingScreen), findsOneWidget);
      expect(find.byType(DisplayTextScreen), findsNothing);
    },
  );

  testWidgets(
      'Test that the text is sent to the display page and navigate '
      'back to the typing back where the text is empty', (
    widgetTester,
  ) async {
    await widgetTester.pumpWidget(const MyApp());
    const inputText = 'My text';
    await widgetTester.enterText(find.byKey(const Key('text-form')), inputText);
    await widgetTester.tap(find.byType(FloatingActionButton));
    await widgetTester.pumpAndSettle();

    expect(find.byType(DisplayTextScreen), findsOneWidget);
    expect(find.text(inputText), findsOneWidget);
    expect(find.byType(TypingScreen), findsNothing);
    await widgetTester.tap(find.byType(BackButton));
    await widgetTester.pumpAndSettle();

    expect(find.byType(DisplayTextScreen), findsNothing);
    expect(find.byType(TypingScreen), findsOneWidget);
    expect(find.text(inputText), findsNothing);
  });
}
