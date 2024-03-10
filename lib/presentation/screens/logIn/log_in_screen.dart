import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../../providers/providers.dart';

class LogInScreen extends ConsumerWidget {
  static const String name = 'logInScreen';
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentYear = DateTime.now().year;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _ImageLogIn(),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to the Amazing Shopping App!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _SignInButton(ref: ref),
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

class _ImageLogIn extends StatelessWidget {
  const _ImageLogIn();

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading.gif',
      image: 'https://i.ibb.co/12MT5rL/log-in-img.png',
      fit: BoxFit.cover,
    );
  }
}

typedef OnSignIn = Future<void> Function();

class _SignInButton extends StatelessWidget {
  final WidgetRef ref;
  const _SignInButton({required this.ref});

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.google,
      text: 'Sign in with Google',
      onPressed: () async {
        await ref.read(authenticationNotifierProvider.notifier).logInUser();
      },
    );
  }
}
