import 'package:amazing_shopping/domain/entities/auth/user_response.dart';

abstract class AuthenticationDataSource {
  Future<UserResponse> logIn();
  Future<void> logOut();
}
