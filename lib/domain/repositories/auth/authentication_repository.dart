import 'package:amazing_shopping/domain/entities/auth/user_response.dart';

abstract class AuthenticationRepository {
  Future<UserResponse> logIn();
  Future<void> logOut();
}
