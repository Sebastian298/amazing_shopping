class UserResponse {
  final String id;
  final String? email;
  final String? name;
  final String? photoUrl;

  UserResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
  });
}
