//import 'package:amazing_shopping/infrastructure/mappers/auth/user_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:amazing_shopping/domain/datasources/auth/authentication_datasource.dart';
import 'package:amazing_shopping/domain/entities/auth/user_response.dart';

class AuthenticationDatasourceImpl extends AuthenticationDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<UserResponse?> logIn() async {
    final googleAuthProvider = GoogleAuthProvider();
    final userCredential = await _auth.signInWithProvider(googleAuthProvider);
    if (userCredential.user == null) return null;
    return UserResponse(
      id: userCredential.user!.uid,
      email: userCredential.user!.email,
      name: userCredential.user!.displayName,
      photoUrl: userCredential.user!.photoURL,
    );
  }

  @override
  Future<void> logOut() {
    return _auth.signOut();
  }
}
