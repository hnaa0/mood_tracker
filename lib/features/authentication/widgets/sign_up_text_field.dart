import 'package:flutter/material.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpTextField extends StatefulWidget {
  const SignUpTextField({
    super.key,
    required this.fieldName,
    required this.controller,
    required this.fieldValue,
    required this.formData,
  });

  final String fieldName;
  final String fieldValue;
  final Map<String, String> formData;
  final TextEditingController controller;

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  bool _isHidden = true;

  void _onEyeTap() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  bool _emailCheck(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    return RegExp(pattern).hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: const TextStyle(
            color: Color(
              ThemeColors.cadetgray,
            ),
          ),
        ),
        TextFormField(
          obscureText:
              _isHidden && widget.fieldName == "Password" ? true : false,
          autocorrect: false,
          decoration: InputDecoration(
            isDense: true,
            fillColor: Colors.white,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(
                  ThemeColors.cadetgray,
                ),
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(
                  ThemeColors.lavenderPink,
                ),
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(
                  ThemeColors.imperialRed,
                ),
              ),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(
                  ThemeColors.imperialRed,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 6,
              bottom: 6,
            ),
            suffix: widget.fieldName == "Password"
                ? GestureDetector(
                    onTap: _onEyeTap,
                    child: FaIcon(
                      _isHidden
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      size: 16,
                      color: const Color(
                        ThemeColors.cadetgray,
                      ),
                    ),
                  )
                : null,
          ),
          validator: (value) {
            switch (widget.fieldName) {
              case "Name":
                if (value != null && value.length < 2) {
                  return "Name must be at least 2 characters.";
                }
                return null;
              case "Email":
                if (value != null && !_emailCheck(value)) {
                  return "Please enter a valid email.";
                }
                return null;

              case "Password":
                if (value != null && value.length < 8) {
                  return "Password must be at least 8 characters.";
                }
                return null;
            }
            return null;
          },
          onSaved: (newValue) {
            if (newValue != null) {
              widget.formData[widget.fieldName.toLowerCase()] = newValue;
            }
          },
        ),
      ],
    );
  }
}
