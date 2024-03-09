import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = '/logInScreen';
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/log_in_img.png',
      fit: BoxFit.cover,
    );
  }
}
