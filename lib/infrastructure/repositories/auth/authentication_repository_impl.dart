import 'package:amazing_shopping/domain/datasources/auth/authentication_datasource.dart';
import 'package:amazing_shopping/domain/entities/auth/user_response.dart';
import 'package:amazing_shopping/domain/repositories/auth/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource authenticationDataSource;

  AuthenticationRepositoryImpl({required this.authenticationDataSource});
  @override
  Future<UserResponse> logIn() {
    return authenticationDataSource.logIn();
  }

  @override
  Future<void> logOut() {
    return authenticationDataSource.logOut();
  }
}
