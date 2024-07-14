import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/authentication/repos/auth_repository.dart';
import 'package:mood_tracker/features/settings/view_models/theme_config_view_model.dart';
import 'package:mood_tracker/features/write_mood/models/mood_model.dart';
import 'package:mood_tracker/features/write_mood/repos/mood_repository.dart';

class UploadMoodViewModel extends AsyncNotifier<void> {
  late final WriteMoodRepository _moodRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _moodRepository = ref.read(moodRepo);
    _authRepository = ref.read(authRepo);
  }

  Future<void> uploadMood(
      {required Map<String, dynamic> form,
      required BuildContext context}) async {
    state = const AsyncValue.loading();
    final user = _authRepository.user!;
    final isDark = ref.read(themeConfigProvider).darkMode;

    state = await AsyncValue.guard(() async {
      await _moodRepository.saveMood(
        MoodModel(
          title: form["title"]!,
          content: form["content"]!,
          userName: "userName",
          userUid: user.uid,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          moodType: form["moodType"]!,
        ),
      );
    });

    if (!state.hasError) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor:
              Color(isDark ? ThemeColors.outerSpace : ThemeColors.babypowder),
          content: Text(
            "Mood upload completed!",
            style: TextStyle(
              color: Color(
                isDark ? ThemeColors.babypowder : ThemeColors.outerSpace,
              ),
            ),
          ),
        ),
      );
    }
  }
}

final uploadMoodProvider = AsyncNotifierProvider<UploadMoodViewModel, void>(
  () => UploadMoodViewModel(),
);
