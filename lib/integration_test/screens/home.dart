import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_glance_testing_in_flutter/integration_test/screens/display_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submitText() {
    FocusScope.of(context).unfocus();
    bool valid = _formKey.currentState!.validate();

    if (!valid) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DisplayText(
          text: textEditingController.text.trim(),
        ),
      ),
    );
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
