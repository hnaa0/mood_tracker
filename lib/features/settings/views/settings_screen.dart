import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/authentication/view_models/auth_view_model.dart';
import 'package:mood_tracker/features/authentication/views/sign_in_screen.dart';
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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color(isDark
                          ? ThemeColors.outerSpace
                          : ThemeColors.babypowder),
                      elevation: 0,
                      title: const Text(
                        "Are you sure to sign out?",
                      ),
                      content: Text(
                        "Even if you sign out, your saved moods will not be deleted.",
                        style: TextStyle(
                          color: isDark
                              ? const Color(ThemeColors.cadetgray)
                              : const Color(
                                  ThemeColors.dimGray,
                                ),
                        ),
                      ),
                      actionsPadding: const EdgeInsets.only(
                        bottom: 6,
                      ),
                      actions: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Divider(
                              color: isDark
                                  ? const Color(ThemeColors.dimGray)
                                  : const Color(
                                      ThemeColors.platinum,
                                    ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                ref.read(authProvider.notifier).signOut();
                                context.goNamed(SignInScreen.routeName);
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign out",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(
                                          ThemeColors.imperialRed,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: isDark
                                  ? const Color(ThemeColors.dimGray)
                                  : const Color(
                                      ThemeColors.platinum,
                                    ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                context.pop();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
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
