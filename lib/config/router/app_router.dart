import 'package:amazing_shopping/presentation/screens/logIn/log_in_screen.dart';
import 'package:go_router/go_router.dart';

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
