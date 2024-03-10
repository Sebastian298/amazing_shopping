import 'package:amazing_shopping/domain/entities/auth/user_info.dart';

abstract class AuthenticationDataSource {
  Future<UserInfo> logIn();
  Future<void> logOut();
}
