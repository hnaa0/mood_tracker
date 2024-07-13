import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/repos/auth_repository.dart';
import 'package:mood_tracker/features/write_mood/models/mood_model.dart';
import 'package:mood_tracker/features/write_mood/repos/mood_repository.dart';

class FetchMoodViewModel extends StreamNotifier<List<MoodModel>> {
  @override
  Stream<List<MoodModel>> build() {
    return _fetchMoods();
  }

  Stream<List<MoodModel>> _fetchMoods() {
    final user = ref.read(authRepo).user;
    final result = ref.read(moodRepo).streamMoods(user!.uid);

    return result;
  }

  Future<void> deleteMood(String id) async {
    await ref.read(moodRepo).deleteMood(id);
    _fetchMoods();
  }
}

final fetchMoodProvider =
    StreamNotifierProvider<FetchMoodViewModel, List<MoodModel>>(
  () => FetchMoodViewModel(),
);
