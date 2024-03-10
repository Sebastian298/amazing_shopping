import 'package:amazing_shopping/domain/entities/auth/user_info.dart';

abstract class AuthenticationRepository {
  Future<UserInfo> logIn();
  Future<void> logOut();
}
