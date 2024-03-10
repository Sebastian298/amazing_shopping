import 'package:amazing_shopping/domain/entities/auth/user_response.dart';
import 'package:amazing_shopping/presentation/providers/auth/authentication_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationNotifierProvider =
    StateNotifierProvider<AuthenticationNotifier, UserResponse?>((ref) {
  final authNotifier = ref.watch(authenticationRepositoryProvider);
  return AuthenticationNotifier(
    logIn: authNotifier.logIn,
    logOut: authNotifier.logOut,
  );
});

typedef LogInCallback = Future<UserResponse?> Function();
typedef LogOutCallback = Future<void> Function();

class AuthenticationNotifier extends StateNotifier<UserResponse?> {
  final LogInCallback logIn;
  final LogOutCallback logOut;
  AuthenticationNotifier({required this.logIn, required this.logOut})
      : super(null);

  Future<void> logInUser() async {
    final user = await logIn();
    state = user;
  }

  Future<void> logOutUser() async {
    await logOut();
    state = null;
  }
}
