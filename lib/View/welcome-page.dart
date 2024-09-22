import 'package:buttom_sheet_iti/Models/login_button_sheet.dart';
import 'package:flutter/material.dart';

import '../Models/buttom.dart';
import '../Models/register_bottom_sheet.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Make the container fill the screen width
        height: double.infinity,
        color: const Color(0xFF050522),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'Assets/Image/Illustration Picture.png',
                fit: BoxFit.contain,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      color: Color(0xFFEF5858),
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 20),
                    child: Center(
                      child: Text(
                        "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed \ndo eiusmod",
                        style: TextStyle(
                          color: Color(0xFFF4F4F4),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ), // Add some spacing before the button
                  ButtonWidget(
                    text: 'Create Account',
                    color: const Color(0xFFFFDE69),
                    fontColor: const Color(0xFF050522),
                    fontSize: 15,
                    onPressed: () {
                      showModalBottomSheet(
                          // isScrollControlled: true,
                          context: context,
                          builder: (context) => const SizedBox(
                              height: 3000, child: RegisterBottomSheet()));
                      print('Login pressed!');
                    },
                    vertical: 20,
                    herizontal: 65,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      print('Login pressed!');
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const LoginBottomSheet();
                        },
                      );
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(
                        width: 3.0,
                        color: Color(0xFFFFDE69),
                      )),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18.0), // Circular radius
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 90,
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xFFFFDE69),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "All Right Reserved @2021",
                    style: TextStyle(
                      color: Color(0xFFFFDE69),
                      fontSize: 13,
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
