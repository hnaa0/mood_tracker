import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/settings/view_models/theme_config_view_model.dart';
import 'package:mood_tracker/features/write_mood/models/mood_model.dart';
import 'package:intl/intl.dart';

class MoodCard extends ConsumerStatefulWidget {
  const MoodCard({super.key, required this.mood});

  final MoodModel mood;

  @override
  ConsumerState<MoodCard> createState() => _MoodCardState();
}

class _MoodCardState extends ConsumerState<MoodCard> {
  String _convertDate(int date) {
    DateTime createDate =
        DateTime.fromMillisecondsSinceEpoch(widget.mood.createdAt);
    String convertDate = DateFormat.yMd().add_jm().format(createDate);

    return convertDate;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeConfigProvider).darkMode;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              _convertDate(widget.mood.createdAt),
              style: const TextStyle(
                color: Color(
                  ThemeColors.cadetgray,
                ),
              ),
            ),
          ),
          const Gap(8),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            decoration: BoxDecoration(
              color:
                  isDark ? const Color(ThemeColors.outerSpace) : Colors.white,
              border: Border.all(
                width: 1,
                color: const Color(
                  ThemeColors.lavender,
                ),
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(ThemeColors.lavender),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(widget.mood.moodType.color),
                      ),
                      child: Text(
                        widget.mood.title,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(
                            ThemeColors.babypowder,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(14),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    widget.mood.content,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
