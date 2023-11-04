import 'package:flutter/material.dart';

class DisplayTextScreen extends StatefulWidget {
  const DisplayTextScreen({super.key, required this.text,required this.doOnInit,});

  final String text;
  final Function doOnInit;

  @override
  State<DisplayTextScreen> createState() => _DisplayTextScreenState();
}

class _DisplayTextScreenState extends State<DisplayTextScreen> {

  @override
  void initState() {
    super.initState();
    widget.doOnInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.text),
        elevation: 0,
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Entered text is: ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.grey
            ),
            children: [
              TextSpan(
                text: widget.text,
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
