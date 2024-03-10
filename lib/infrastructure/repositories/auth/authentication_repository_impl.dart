import 'package:firebase_auth/firebase_auth.dart';
import 'package:amazing_shopping/domain/entities/auth/user_response.dart';
import 'package:amazing_shopping/domain/repositories/auth/authentication_repository.dart';
import 'package:amazing_shopping/infrastructure/mappers/auth/user_mapper.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<UserResponse> logIn() async {
    final googleAuthProvider = GoogleAuthProvider();
    final userCredential = await _auth.signInWithProvider(googleAuthProvider);
    return UserMapper.castToEntity(userCredential.user!);
  }

  @override
  Future<void> logOut() async {
    return await _auth.signOut();
  }
}
