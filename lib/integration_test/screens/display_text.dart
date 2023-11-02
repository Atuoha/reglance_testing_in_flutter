import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  const DisplayText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Text'),
        elevation: 0,
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Enter text is: ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.grey
            ),
            children: [
              TextSpan(
                text: text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
