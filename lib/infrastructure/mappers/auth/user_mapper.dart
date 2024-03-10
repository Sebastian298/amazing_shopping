import 'package:amazing_shopping/domain/entities/auth/user_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserMapper {
  static UserResponse castToEntity(User user) {
    return UserResponse(
      id: user.uid,
      email: user.email,
      name: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
