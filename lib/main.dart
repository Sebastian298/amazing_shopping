import 'package:amazing_shopping/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:amazing_shopping/config/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0, isDarkMode: false).getTheme(),
    );
  }
}
