import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/write_mood/views/write_screen.dart';

class WriteTextField extends StatelessWidget {
  const WriteTextField({
    super.key,
    required this.controller,
    required this.fieldName,
    required this.isDark,
    required this.formData,
  });

  final TextEditingController controller;
  final String fieldName;
  final bool isDark;
  final Map<String, String> formData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
          ),
          child: Text(
            fieldName.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(
                ThemeColors.lavenderPink,
              ),
            ),
          ),
        ),
        const Gap(8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                fieldName == FieldType.content.name ? 24 : 32),
            boxShadow: const [
              BoxShadow(
                color: Color(ThemeColors.thistle),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            maxLines: fieldName == FieldType.content.name ? 7 : 1,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor:
                  isDark ? const Color(ThemeColors.outerSpace) : Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(
                    ThemeColors.thistle,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  fieldName == FieldType.content.name ? 24 : 32,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(
                    ThemeColors.thistle,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  fieldName == FieldType.content.name ? 24 : 32,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(
                    ThemeColors.lavenderPink,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  fieldName == FieldType.content.name ? 24 : 32,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(
                    ThemeColors.lavenderPink,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  fieldName == FieldType.content.name ? 24 : 32,
                ),
              ),
            ),
            validator: (value) {
              if (value != null && value.length < 2) {
                if (fieldName == FieldType.title.name) {
                  return "Title must be at least two characters.";
                } else {
                  return "Please enter your content.";
                }
              }
              return null;
            },
            onSaved: (newValue) {
              if (newValue != null) {
                formData[fieldName] = newValue;
              }
            },
          ),
        ),
      ],
    );
  }
}
