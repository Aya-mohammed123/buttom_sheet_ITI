import 'package:flutter/material.dart';

// import '../Widget/list_view.dart';
import '../Widget/text_form_field.dart';
import 'buttom.dart';
import 'login_button_sheet.dart';

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet({super.key});

  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheet();
}

class _RegisterBottomSheet extends State<RegisterBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _courseController = TextEditingController();

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: const Color(0xFFFFECAA),
        child: SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Hello...",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF050522),
                              ),
                            ),
                          ),
                          Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF050522),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.cancel_outlined),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: const Color(0xFFEF5858),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FieldOfText(
                    hintText: 'username/email',
                    icon: const Icon(Icons.visibility),
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "username name is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FieldOfText(
                    hintText: ' course',
                    icon: const Icon(Icons.visibility),
                    controller: _courseController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "course name is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FieldOfText(
                    hintText: ' password',
                    icon: const Icon(Icons.lock_outlined),
                    controller: _passwordController,
                    obsecure: true,
                    validator: _validatePassword,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FieldOfText(
                    hintText: 'confirm password',
                    icon: const Icon(Icons.lock_outlined),
                    controller: _confirmPasswordController,
                    obsecure: true,
                    validator: _validateConfirmPassword,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  text: 'Register',
                  color: const Color(0xFF050522),
                  fontColor: const Color(0xFFFFDE69),
                  fontSize: 15,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {}
                  },
                  vertical: 20,
                  herizontal: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have account?",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF050522),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => const SizedBox(
                                height: 3000, child: LoginBottomSheet()));
                        // print('Login pressed!');
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFEF5858),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
