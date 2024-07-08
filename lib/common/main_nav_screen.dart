import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/home/views/home_screen.dart';
import 'package:mood_tracker/features/settings/views/settings_screen.dart';
import 'package:mood_tracker/features/write_mood/views/write_screen.dart';

class MainNavScreen extends StatefulWidget {
  static const routeName = "main-nav";
  static const tabs = [
    HomeScreen.routeName,
    WriteScreen.routeName,
    SettingsScreen.routeName,
  ];

  final String tab;

  const MainNavScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  late int _selectedIndex = MainNavScreen.tabs.indexOf(widget.tab);

  void _onNavTap(int idx) {
    _selectedIndex = idx;

    context.go("/${MainNavScreen.tabs[idx]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const WriteScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const SettingsScreen(),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(
          ThemeColors.babypowder,
        ),
        buttonBackgroundColor: const Color(ThemeColors.lavender),
        color: const Color(
          ThemeColors.uranianBlue,
        ),
        onTap: (index) => _onNavTap(index),
        items: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              "assets/images/home.png",
              width: 24,
              color: const Color(ThemeColors.outerSpace),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              "assets/images/edit.png",
              width: 24,
              color: const Color(ThemeColors.outerSpace),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              "assets/images/settings.png",
              width: 24,
              color: const Color(ThemeColors.outerSpace),
            ),
          ),
        ],
      ),
    );
  }
}
