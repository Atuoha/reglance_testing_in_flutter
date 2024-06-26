import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_glance_testing_in_flutter/pages/news_page.dart';
import 'package:re_glance_testing_in_flutter/providers/news_notifier.dart';
import 'package:re_glance_testing_in_flutter/services/news_service.dart';

import 'integration_test/screens/typing.dart';
import 'integration_test2/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      // home: ChangeNotifierProvider(
      //   create: (_) => NewsChangeNotifier(NewsService()),
      //   child: const NewsPage(),
      // ),

      // home: TypingScreen() //integration test
      // );

      home: LoginScreen(),
    ); // integration test 2
  }
}
