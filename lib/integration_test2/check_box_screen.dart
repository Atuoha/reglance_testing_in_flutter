import 'package:flutter/material.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({super.key});

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  List<bool> checkValue = List.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check List'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: List.generate(
            30,
            (index) => CheckboxListTile(
              title: Text('Item $index'),
              value: checkValue[index],
              onChanged: (value) {
                setState(() {
                  checkValue[index] = value!;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
