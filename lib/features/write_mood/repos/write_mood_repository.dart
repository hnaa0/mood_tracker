import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/write_mood/models/mood_model.dart';

class WriteMoodRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveMood(MoodModel data) async {
    await _db.collection("moods").add(data.toJson());
  }
}

final writeMoodRepo = Provider(
  (ref) => WriteMoodRepository(),
);
