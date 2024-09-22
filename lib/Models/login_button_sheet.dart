import 'package:flutter/material.dart';

import '../Controller/user_controller.dart';
// import '../Widget/list_view.dart';
import '../Widget/text_form_field.dart';
import 'buttom.dart';
import 'register_bottom_sheet.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  final _userController = UserController();
  bool _isChecked = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final user = _userController.createUser(
          _usernameController.text, _passwordController.text);
      print("Login as ${user.username}");
      // Navigator.pop(context);
    } else {
      print("Login Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: const Color(0xFFFFECAA),
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                            "Welcome Back!!!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF050522),
                            ),
                          ),
                        ),
                        Text(
                          "Login",
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
              // ListTileWidget(
              //   icon: const Icon(Icons.closed_caption_off_outlined),
              //   formName: 'Login',
              //   text: 'Welcome Back!!!',
              // ),
              const SizedBox(
                height: 15,
              ),
              FieldOfText(
                hintText: 'username/email',
                icon: const Icon(Icons.visibility),
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              FieldOfText(
                hintText: ' password',
                obsecure: true,
                icon: const Icon(Icons.lock_outlined),
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),

              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked = newValue ?? false;
                      });
                    },
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF050522),
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF050522),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              ButtonWidget(
                text: 'Login',
                color: const Color(0xFF050522),
                fontColor: const Color(0xFFFFDE69),
                fontSize: 15,
                onPressed: _submit,
                vertical: 28,
                herizontal: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF050522),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => const SizedBox(
                                height: 3000, child: RegisterBottomSheet()));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFEF5858),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
