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

  // Integration TEST
  //
  // testWidgets(
  //   "Test that the input text is not empty while it takes to the different page",
  //   (widgetTester) async {
  //     await widgetTester.pumpWidget(const MyApp());
  //
  //     await widgetTester.tap(find.byType(FloatingActionButton));
  //     await widgetTester.pump();
  //     expect(find.text('Value can not be empty'), findsOneWidget);
  //     expect(find.byType(TypingScreen), findsOneWidget);
  //     expect(find.byType(DisplayTextScreen), findsNothing);
  //   },
  // );
  //
  // testWidgets(
  //     'Test that the text is sent to the display page and navigate '
  //     'back to the typing back where the text is empty', (
  //   widgetTester,
  // ) async {
  //   await widgetTester.pumpWidget(const MyApp());
  //   const inputText = 'My text';
  //   await widgetTester.enterText(find.byKey(const Key('text-form')), inputText);
  //   await widgetTester.tap(find.byType(FloatingActionButton));
  //   await widgetTester.pumpAndSettle();
  //
  //   expect(find.byType(DisplayTextScreen), findsOneWidget);
  //   expect(find.text(inputText), findsOneWidget);
  //   expect(find.byType(TypingScreen), findsNothing);
  //   await widgetTester.tap(find.byType(BackButton));
  //   await widgetTester.pumpAndSettle();
  //
  //   expect(find.byType(DisplayTextScreen), findsNothing);
  //   expect(find.byType(TypingScreen), findsOneWidget);
  //   expect(find.text(inputText), findsNothing);
  // });

  // Integration TEST 2

  testWidgets('Test that the fields can not be empty', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Login with credentials'), findsOneWidget);
    expect(find.byKey(const Key('email')), findsOneWidget);
    expect(find.byKey(const Key('password')), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Email can not be empty'), findsOneWidget);
    expect(find.text('Password can not be empty'), findsOneWidget);
  });

  testWidgets(
      'Test that the fields are '
      'filled and it goes to a new page and that the check box the '
      'first checkbox is checked and others are not '
      'checked then click on the back button and go '
      'back to the login button with the text fields empty', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Login with credentials'), findsOneWidget);
    expect(find.byKey(const Key('email')), findsOneWidget);
    expect(find.byKey(const Key('password')), findsOneWidget);

    String email = "doe@gmail.com";
    String password = "00000000";
    await tester.enterText(find.byKey(const Key('email')), email);
    await tester.enterText(find.byKey(const Key('password')), password);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Login with credentials'), findsNothing);
    expect(find.byKey(const Key('email')), findsNothing);
    expect(find.byKey(const Key('password')), findsNothing);

    expect(find.text('Check List'), findsOneWidget);
    expect(find.byType(CheckboxListTile).first, findsOneWidget);
    expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile).first).value, isFalse);
    await tester.tap(find.byType(CheckboxListTile).first);
    await tester.pumpAndSettle();
    expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile).first).value, isTrue);


    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('Login with credentials'), findsOneWidget);
    expect(find.byKey(const Key('email')), findsOneWidget);
    expect(find.byKey(const Key('password')), findsOneWidget);

    expect(find.text('Check List'), findsNothing);
    expect(find.text(email), findsNothing);
    expect(find.text(password), findsNothing);

  });
}
