class UserModel {
  final String name;
  final String uid;
  final String email;

  UserModel({
    required this.name,
    required this.uid,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "uid": uid,
      "email": email,
    };
  }
}
