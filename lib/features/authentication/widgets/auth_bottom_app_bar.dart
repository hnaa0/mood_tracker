import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mood_tracker/constants/colors.dart';

class AuthBottomAppBar extends StatelessWidget {
  const AuthBottomAppBar({
    super.key,
    required this.sentence,
    required this.name,
    required this.onTapFunc,
  });

  final String sentence;
  final String name;
  final Function onTapFunc;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTapFunc(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sentence,
                    style: const TextStyle(
                      color: Color(
                        ThemeColors.outerSpace,
                      ),
                    ),
                  ),
                  const Gap(6),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(
                        ThemeColors.outerSpace,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
