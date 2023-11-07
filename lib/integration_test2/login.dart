import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'check_box_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordObscure = true;

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {});
    });
  }

  // submit form
  void submitForm() {
    FocusScope.of(context).unfocus();
    bool valid = _formKey.currentState!.validate();

    if (!valid) {
      return;
    }

    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => const CheckBoxScreen(),
          ),
        )
        .then(
          (value) => {
            emailController.clear(),
            passwordController.clear(),
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Login with credentials',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                key: const Key('email'),
                controller: emailController,
                autofocus: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 3) {
                    return "Email can not be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    CupertinoIcons.envelope,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your email',
                  label: const Text('Email'),
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
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('password'),
                controller: passwordController,
                autofocus: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 3) {
                    return "Password can not be empty";
                  }
                  return null;
                },
                obscureText: isPasswordObscure,
                decoration: InputDecoration(
                  suffixIcon: isPasswordObscure
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordObscure = !isPasswordObscure;
                            });
                          },
                          child: Icon(
                            isPasswordObscure
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                          ),
                        )
                      : const SizedBox.shrink(),
                  prefixIcon: const Icon(
                    CupertinoIcons.padlock,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your password',
                  label: const Text('Password'),
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
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => submitForm(),
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
