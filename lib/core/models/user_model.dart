class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String userId;
  final String imageUrl;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userId,
    required this.imageUrl,
  });

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      email: jsonData['email'],
      userId: jsonData['userId'],
      imageUrl: jsonData['imageUrl'],
    );
  }
}
