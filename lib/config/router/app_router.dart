import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amazing_shopping/presentation/screens/screens.dart';

final key = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LogInScreen.routeName,
      builder: (context, state) => const LogInScreen(),
    ),
  ],
);
