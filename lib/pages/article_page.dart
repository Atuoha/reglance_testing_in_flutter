import 'package:flutter/material.dart';

import '../models/article.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  const ArticlePage({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: mq.padding.top,
          bottom: mq.padding.bottom,
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            Text(article.content),
          ],
        ),
      ),
    );
  }
}
