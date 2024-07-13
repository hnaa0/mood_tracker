import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mood_tracker/constants/colors.dart';

class SignInTextField extends StatefulWidget {
  const SignInTextField({
    super.key,
    required this.fieldName,
    required this.formData,
    required this.controller,
    this.emailCheck,
  });

  final String fieldName;
  final Map<String, String> formData;
  final TextEditingController controller;
  final Function(String)? emailCheck;

  @override
  State<SignInTextField> createState() => _SignInTextFieldState();
}

class _SignInTextFieldState extends State<SignInTextField> {
  bool isInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
            controller: widget.controller,
            obscureText: widget.fieldName == "Password" ? true : false,
            autocorrect: false,
            autofocus: false,
            decoration: InputDecoration(
              labelText: widget.fieldName,
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
              if (value != null && widget.fieldName == "Email") {
                if (!widget.emailCheck!(value)) {
                  setState(() {
                    isInvalid = true;
                  });
                }
              }
              return null;
            },
            onSaved: (newValue) {
              if (newValue != null) {
                widget.formData[widget.fieldName.toLowerCase()] = newValue;
              }
            },
          ),
        ),
        const Gap(6),
        if (isInvalid)
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              "The email format is invalid.",
              style: TextStyle(
                fontSize: 12,
                color: Color(
                  ThemeColors.imperialRed,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
