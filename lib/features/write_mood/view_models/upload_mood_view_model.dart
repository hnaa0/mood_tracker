import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/repos/auth_repository.dart';
import 'package:mood_tracker/features/write_mood/models/mood_model.dart';
import 'package:mood_tracker/features/write_mood/repos/write_mood_repository.dart';

class UploadMoodViewModel extends AsyncNotifier<void> {
  late final WriteMoodRepository _moodRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _moodRepository = ref.read(writeMoodRepo);
    _authRepository = ref.read(authRepo);
  }

  Future<void> uploadMood(
      {required Map<String, String> form,
      required BuildContext context}) async {
    state = const AsyncValue.loading();
    final user = _authRepository.user!;

    state = await AsyncValue.guard(() async {
      await _moodRepository.saveMood(
        MoodModel(
          title: form["title"]!,
          content: form["content"]!,
          userName: "userName",
          userUid: user.uid,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    });

    if (!state.hasError) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mood upload completed!"),
        ),
      );
    }
  }
}

final uploadMoodProvider = AsyncNotifierProvider<UploadMoodViewModel, void>(
  () => UploadMoodViewModel(),
);
