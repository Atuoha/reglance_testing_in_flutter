import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_glance_testing_in_flutter/integration_test/screens/display_text.dart';

class TypingScreen extends StatefulWidget {
  const TypingScreen({super.key});

  @override
  State<TypingScreen> createState() => _TypingScreenState();
}

class _TypingScreenState extends State<TypingScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void doOnInit() {
    // Todo implement this
  }

  void submitText() {
    FocusScope.of(context).unfocus();
    bool valid = _formKey.currentState!.validate();

    if (!valid) {
      return;
    }

    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => DisplayTextScreen(
              text: textEditingController.text.trim(),
              doOnInit: doOnInit,
            ),
          ),
        )
        .then((value) => {textEditingController.clear()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => submitText(),
        child: const Icon(
          CupertinoIcons.check_mark_circled,
        ),
      ),
      appBar: AppBar(
        title: const Text('Integration Test'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                key: const Key('text-form'),
                controller: textEditingController,
                autofocus: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 3) {
                    return "Value can not be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    CupertinoIcons.text_bubble,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter a text',
                  label: const Text('Random Text'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
