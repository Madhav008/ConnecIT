class Users {
  final String userId;
  final String email;
  final String username;
  final String name;
  final String bio;
  final String image;
  final bool isAdmin;

  Users(
      {this.username,
      this.name,
      this.image,
      this.email,
      this.bio,
      this.userId,
      this.isAdmin});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'name': name,
      'bio':bio,
      'image': image,
      'email': email, 
      'isAdmin': isAdmin,
    };
  }

  factory Users.fromFirestore(Map<String, dynamic> firestore) {
    if (firestore == null) return null;

    return Users(
        email: firestore['email'],
        userId: firestore['userId'],
        username: firestore['username'],
        name: firestore['name'],
        bio: firestore['bio'],
        image: firestore['image'],
        isAdmin: firestore['isAdmin']); 
  }
}
