import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:amazing_shopping/presentation/providers/providers.dart';
import 'package:amazing_shopping/presentation/screens/screens.dart';

final key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authenticationNotifierProvider);
  return GoRouter(
    navigatorKey: key,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/${LogInScreen.routeName}',
        name: LogInScreen.routeName,
        builder: (context, state) {
          return const LogInScreen();
        },
      )
    ],
    redirect: (context, state) {
      final isAuthenticated = authState;
      if (state.fullPath == '/${LogInScreen.routeName}' &&
          isAuthenticated != null) {
        return '/';
      }
      if (state.fullPath != '/${LogInScreen.routeName}' &&
          isAuthenticated == null) {
        return '/${LogInScreen.routeName}';
      }
      return null;
    },
  );
});
