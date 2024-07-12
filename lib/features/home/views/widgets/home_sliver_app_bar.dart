import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/settings/view_models/theme_config_view_model.dart';

class HomeSliverAppBar extends ConsumerWidget {
  const HomeSliverAppBar({
    super.key,
    required this.scrollTop,
  });

  final Function scrollTop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeConfigProvider).darkMode;

    return SliverAppBar(
      centerTitle: true,
      toolbarHeight: 120,
      floating: true,
      snap: true,
      title: GestureDetector(
        onTap: () => scrollTop(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Stack(
            children: [
              Transform.rotate(
                angle: -0.10,
                child: ClipOval(
                  child: Container(
                    width: 240,
                    height: 85,
                    color: Color(isDark
                        ? ThemeColors.babypowder
                        : ThemeColors.uranianBlue),
                  ),
                ),
              ),
              Positioned(
                left: 56,
                top: 3,
                child: Text(
                  "Mood",
                  style: TextStyle(
                    fontFamily: "McKloudFilled",
                    fontSize: 48,
                    height: 0.9,
                    color: isDark
                        ? const Color(ThemeColors.uranianBlue)
                        : Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 40,
                bottom: 5,
                child: Text(
                  "Tracker",
                  style: TextStyle(
                    fontFamily: "McKloudFilled",
                    fontSize: 40,
                    height: 1.1,
                    color: isDark
                        ? const Color(ThemeColors.uranianBlue)
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
