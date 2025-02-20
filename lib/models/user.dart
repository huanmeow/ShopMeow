class User {
  final String id;
  final String username;
  final String email;

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  factory User.fromFirebaseUser(User? firebaseUser) {
    if (firebaseUser == null) {
      return User(
        id: '',
        username: '',
        email: '',
      );
    }

    return User(
      id: firebaseUser.id,
      username: firebaseUser.username  ?? '',
      email: firebaseUser.email ?? '',
    );
  }
}