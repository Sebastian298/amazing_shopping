import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:amazing_shopping/presentation/providers/providers.dart';
import 'package:amazing_shopping/presentation/screens/screens.dart';

import '../../presentation/providers/auth/authentication_provider.dart';

final key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authenticationNotifierProvider);
  return GoRouter(
    navigatorKey: key,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/${SplashScreen.name}',
        name: SplashScreen.name,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) {
          return HomeScreen(
            user: authState,
          );
        },
      ),
      GoRoute(
        path: '/${LogInScreen.name}',
        name: LogInScreen.name,
        builder: (context, state) {
          return const LogInScreen();
        },
      )
    ],
    redirect: (context, state) {
      final test = authState;
      if (state.fullPath == '/${LogInScreen.name}') {
        return test != null ? null : '/${LogInScreen.name}';
      }

      return test != null ? null : '/${SplashScreen.name}';
    },
  );
});
