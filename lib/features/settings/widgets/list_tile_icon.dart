import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/constants/colors.dart';

class ListTileIcon extends StatelessWidget {
  const ListTileIcon({
    super.key,
    required this.path,
    required this.isDark,
  });

  final String path;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: 20,
      colorFilter: ColorFilter.mode(
        Color(isDark ? ThemeColors.babypowder : ThemeColors.outerSpace),
        BlendMode.srcIn,
      ),
    );
  }
}
