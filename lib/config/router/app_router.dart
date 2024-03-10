import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
        path: '/',
        name: SplashScreen.name,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/${HomeScreen.name}',
        name: HomeScreen.name,
        builder: (context, state) {
          return const HomeScreen();
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
      final isAuthenticated = authState;

      if (state.fullPath == '/${HomeScreen.name}' && isAuthenticated == null) {
        // Redirige a la pantalla de inicio de sesión si el usuario no está autenticado
        return '/${LogInScreen.name}';
      }

      // De lo contrario, permite el acceso a la ruta solicitada
      return null;
    },
  );
});
