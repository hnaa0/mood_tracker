import 'package:flutter/material.dart';
import 'package:mood_tracker/constants/colors.dart';

class SignInTextField extends StatelessWidget {
  const SignInTextField({
    super.key,
    required this.fieldName,
    required this.formData,
    required this.controller,
  });

  final String fieldName;
  final Map<String, String> formData;
  final TextEditingController controller;

  bool _emailCheck(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    return RegExp(pattern).hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: fieldName == "Password" ? true : false,
        autocorrect: false,
        autofocus: false,
        decoration: InputDecoration(
          labelText: fieldName,
          labelStyle: const TextStyle(
            color: Color(
              ThemeColors.cadetgray,
            ),
          ),
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(28),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
        ),
        validator: (value) {
          if (value != null && fieldName == "Email") {
            if (!_emailCheck(value)) {
              return "The email format is invalid.";
            }
          }
          return null;
        },
        onSaved: (newValue) {
          if (newValue != null) {
            formData[fieldName.toLowerCase()] = newValue;
          }
        },
      ),
    );
  }
}
