import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/settings/view_models/theme_config_view_model.dart';
import 'package:mood_tracker/features/settings/widgets/list_tile_icon.dart';

class SettingsScreen extends ConsumerWidget {
  static const routeUrl = "/settings";
  static const routeName = "settings";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.read(themeConfigProvider).darkMode;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 56,
              child: const Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            SwitchListTile(
              activeColor: const Color(ThemeColors.uranianBlue),
              inactiveThumbColor: const Color(ThemeColors.babypowder),
              inactiveTrackColor: const Color(ThemeColors.uranianBlue),
              value: ref.watch(themeConfigProvider).darkMode,
              onChanged: (value) {
                ref.read(themeConfigProvider.notifier).setDarkMode(value);
              },
              title: Row(
                children: [
                  ListTileIcon(
                    path: "assets/images/moon_stars.svg",
                    isDark: isDark,
                  ),
                  const Gap(16),
                  const Text("Dark mode"),
                ],
              ),
            ),
            Divider(
              color:
                  Color(isDark ? ThemeColors.davysGray : ThemeColors.platinum),
            ),
            AboutListTile(
              icon: ListTileIcon(
                path: "assets/images/info.svg",
                isDark: isDark,
              ),
              applicationName: "Mood Tracker",
              applicationVersion: "1.0",
            ),
            Divider(
              color:
                  Color(isDark ? ThemeColors.davysGray : ThemeColors.platinum),
            ),
            ListTile(
              leading: ListTileIcon(
                path: "assets/images/sign_out.svg",
                isDark: isDark,
              ),
              title: const Text(
                "Sign Out",
                style: TextStyle(
                  color: Color(
                    ThemeColors.imperialRed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
