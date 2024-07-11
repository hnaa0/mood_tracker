class MoodModel {
  final String title;
  final String content;
  final String userName;
  final String userUid;
  final int createdAt;

  MoodModel({
    required this.title,
    required this.content,
    required this.userName,
    required this.userUid,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
      "userName": userName,
      "userUid": userUid,
      "createdAt": createdAt,
    };
  }
}
