import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/common/mood_type.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/settings/view_models/theme_config_view_model.dart';

class MoodBox extends ConsumerWidget {
  const MoodBox({
    super.key,
    required this.mood,
    required this.selectedIdx,
    required this.index,
  });

  final MoodType mood;
  final int selectedIdx;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.read(themeConfigProvider).darkMode;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: 20,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: selectedIdx == index
            ? Color(mood.color)
            : isDark
                ? const Color(ThemeColors.silver)
                : const Color(ThemeColors.platinum),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        mood.name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
