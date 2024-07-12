import 'package:mood_tracker/common/mood_type.dart';

class MoodModel {
  final String title;
  final String content;
  final String userName;
  final String userUid;
  final int createdAt;
  final MoodType moodType;

  MoodModel({
    required this.title,
    required this.content,
    required this.userName,
    required this.userUid,
    required this.createdAt,
    required this.moodType,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
      "userName": userName,
      "userUid": userUid,
      "createdAt": createdAt,
      "moodType": moodType.name,
    };
  }

  MoodModel.fromJson({required Map<String, dynamic> json})
      : title = json["title"],
        content = json["content"],
        userName = json["userName"],
        userUid = json["userUid"],
        createdAt = json["createdAt"],
        moodType = MoodTypeExtension.fromString(json["moodType"]);
}
