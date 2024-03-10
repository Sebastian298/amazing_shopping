import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = 'logInScreen';
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/log_in_img.png', fit: BoxFit.cover),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to the Amazing Shopping App!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const _SignInButton(),
              ],
            ),
          ),
          Text(
            'Developed By Jaime Tenorio © $currentYear',
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.google,
      text: 'Sign in with Google',
      onPressed: () {},
    );
  }
}
