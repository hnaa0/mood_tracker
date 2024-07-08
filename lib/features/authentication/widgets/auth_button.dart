import 'package:flutter/material.dart';
import 'package:mood_tracker/constants/colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 18,
      ),
      decoration: const BoxDecoration(
        color: Color(
          ThemeColors.lavender,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(
              ThemeColors.babypowder,
            ),
            blurRadius: 5,
            spreadRadius: 0.5,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
