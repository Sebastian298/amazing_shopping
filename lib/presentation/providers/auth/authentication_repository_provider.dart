import 'package:amazing_shopping/infrastructure/datasources/auth/authentication_datasource_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amazing_shopping/infrastructure/repositories/auth/authentication_repository_impl.dart';

final authenticationRepositoryProvider =
    Provider<AuthenticationRepositoryImpl>((ref) {
  return AuthenticationRepositoryImpl(
    authenticationDataSource: AuthenticationDatasourceImpl(),
  );
});
